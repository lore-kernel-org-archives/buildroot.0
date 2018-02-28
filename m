From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Wed, 28 Feb 2018 00:03:53 -0300
Subject: [Buildroot] [PATCH next v2 4/5] support/scripts/pkg-stats-new:
 add latest upstream version information
References: <20180221221342.15683-5-thomas.petazzoni@bootlin.com>
Message-ID: <5a961c197f405_484fb72dfc147d@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This is the last part of my review for v2, as patch 5 is just the rename.

When running the script with a few packages it works well.
But when running the script for all packages, for me it often hangs at the end
(2 out of 5 tries).
It can be related to my setup (python module versions?, internet connection?)
But anyway see later in this email an alternative approach.

When it hangs, by scrolling back I see (in a different place for the each run
that hung):
[snip]
 [1453] python-autobahn => (False, None, None)
Exception in thread Thread-6:
Traceback (most recent call last):
  File "/usr/lib/python2.7/threading.py", line 801, in __bootstrap_inner
    self.run()
  File "/usr/lib/python2.7/threading.py", line 754, in run
    self.__target(*self.__args, **self.__kwargs)
  File "support/scripts/pkg-stats-new", line 309, in get_version_worker
    pkg.latest_version = get_latest_version(pkg.name)
  File "support/scripts/pkg-stats-new", line 300, in get_latest_version
    return get_latest_version_by_guess(package)
  File "support/scripts/pkg-stats-new", line 282, in get_latest_version_by_guess
    f = urllib2.urlopen(req)
  File "/usr/lib/python2.7/urllib2.py", line 154, in urlopen
    return opener.open(url, data, timeout)
  File "/usr/lib/python2.7/urllib2.py", line 435, in open
    response = meth(req, response)
  File "/usr/lib/python2.7/urllib2.py", line 548, in http_response
    'http', request, response, code, msg, hdrs)
  File "/usr/lib/python2.7/urllib2.py", line 467, in error
    result = self._call_chain(*args)
  File "/usr/lib/python2.7/urllib2.py", line 407, in _call_chain
    result = func(*args)
  File "/usr/lib/python2.7/urllib2.py", line 654, in http_error_302
    return self.parent.open(new, timeout=req.timeout)
  File "/usr/lib/python2.7/urllib2.py", line 435, in open
    response = meth(req, response)
  File "/usr/lib/python2.7/urllib2.py", line 548, in http_response
    'http', request, response, code, msg, hdrs)
  File "/usr/lib/python2.7/urllib2.py", line 473, in error
    return self._call_chain(*args)
  File "/usr/lib/python2.7/urllib2.py", line 407, in _call_chain
    result = func(*args)
  File "/usr/lib/python2.7/urllib2.py", line 556, in http_error_default
    raise HTTPError(req.get_full_url(), code, msg, hdrs, fp)
HTTPError: HTTP Error 404: NOT FOUND

 [1452] cups-filters => (False, u'1.20.1', 5541)
[snip]
 [0001] python-flask-login => (False, None, None)
 [0000] luabitop => (False, None, None)
 [0000] python-pyopenssl => (False, None, None)
 [0000] libsexy => (False, None, None)
 [0000] libnetfilter_conntrack => (False, u'1.0.6', 1675)
 [0000] doxygen => (False, u'1.8.14.windows.x64.bin', 457)
 [0000] vdr-plugin-vnsiserver => (False, None, None)
[hangs here, I waited 10 minutes]


On Wed, Feb 21, 2018 at 07:13 PM, Thomas Petazzoni wrote:

> This commit adds fetching the latest upstream version of each package
> from release-monitoring.org.
> 
> The fetching process first tries to use the package mappings of the
> "Buildroot" distribution [1]. If there is no result, then it does a
> regular search, and within the search results, looks for a package
> whose name matches the Buildroot name.
> 
> Since release-monitoring.org is a bit slow, we have 8 threads that
> fetch information in parallel.

For me:
patches 1 to 3:   1m37.798s
patches 1 to 4:  20m5.513s

Alternative:      3m7.943s

[snip]
> +RELEASE_MONITORING_API = "http://release-monitoring.org/api"
> +
> +
> +def get_latest_version_by_distro(package):
> +    req = urllib2.Request(os.path.join(RELEASE_MONITORING_API, "project", "Buildroot", package))

There is also an undocumented API:
http://release-monitoring.org/api/projects/?distro=Buildroot
It was implemented here:
https://github.com/release-monitoring/anitya/commit/f3d8be75a6643b5d8c55754b74ed4f74f71fe952
and will eventually be documented here:
https://github.com/release-monitoring/anitya/issues/420

When the Buildroot distro becomes 90% filled we could get something like this:
$ wget -O Alpine 'http://release-monitoring.org/api/projects/?distro=Alpine'
... 1MB, 15 seconds ...
$ grep -c '"name"' Alpine
1838

> +    f = urllib2.urlopen(req)
> +    data = json.loads(f.read())
> +    if len(data['versions']) > 0:
> +        return (True, data['versions'][0], data['id'])

Also there is a field 'version' that looks to contain the latest version (or
None if there is none). For the majority of projects it is exactly equal to
'versions'[0].
See the test below, but I didn't find a documentation to corroborate this.

$ wget http://release-monitoring.org/api/projects
... 7MB, 1 minute ...
$ cat check.py 
#!/usr/bin/env python
import json

with open("projects") as f:
    data = json.loads(f.read())
for p in data["projects"]:
    if p['version'] is None:
        continue
    if p['version'] == p['versions'][0]:
        continue
    print p['name'], p['version'], p['versions']
$ ./check.py | wc -l
109
$ grep -c '"name"' projects                                                                                        
16445

> +    else:
> +        return (True, None, data['id'])
[snip]
> +def add_latest_version_info(packages):
> +    """
> +    Fills in the .latest_version field of all Package objects
> +
> +    This field has a special format:
> +      (mapping, version, id)
> +    with:
> +    - mapping: boolean that indicates whether release-monitoring.org
> +      has a mapping for this package name in the Buildroot distribution
> +      or not
> +    - version: string containing the latest version known by
> +      release-monitoring.org for this package
> +    - id: string containing the id of the project corresponding to this
> +      package, as known by release-monitoring.org
> +    """

As an alternative approach we could first download 2 lists:
- all projects for distro (now 10, eventually 2000+)
- all projects (now 16000+)
It could even be saved to a file by one option and then loaded by other option
to speedup the development/maintenance.

But that would require:
The projects in the Buildroot distro to be named exactly as the buildroot
package, i.e. samba4, not samba. Or of course implementing the search by
similarity with regexp.

And be aware: it produces few different guesses (some better, some worst).

Here the sample code without Queue/threading:
    cache_latest_version_by_distro()
    cache_latest_version_by_guess()

    for pkg in packages:
        pkg.latest_version = get_latest_version(pkg.name)
        print " [%04d] %s => %s" % (packages.index(pkg), pkg.name, str(pkg.latest_version))


distro_list = None
guess_list = None


def cache_latest_version_by_distro():
    global distro_list
    req = urllib2.Request(os.path.join(RELEASE_MONITORING_API, "projects", "?distro=Buildroot"))
    f = urllib2.urlopen(req)
    distro_list = json.loads(f.read())


def cache_latest_version_by_guess():
    global guess_list
    req = urllib2.Request(os.path.join(RELEASE_MONITORING_API, "projects"))
    f = urllib2.urlopen(req)
    guess_list = json.loads(f.read())


def get_latest_version(package):
    # We first try by using the "Buildroot" distribution on
    # release-monitoring.org, if it has a mapping for the current
    # package name.
    for data in distro_list["projects"]:
        if data["name"] != package:
            continue
        if len(data['versions']) > 0:
            return (True, data['versions'][0], data['id'])
        else:
            return (True, None, data['id'])
    # If that fails because there is no mapping, we try to search
    # in all packages for a package of this name.
    for p in guess_list['projects']:
        if p['name'] == package and len(p['versions']) > 0:
            return (False, p['versions'][0], p['id'])
    return (False, None, None)

> +    q = Queue()
> +    for pkg in packages:
> +        q.put(pkg)
> +    # Since release-monitoring.org is rather slow, we create 8 threads
> +    # that do HTTP requests to the site.
> +    for i in range(8):
> +        t = Thread(target=get_version_worker, args=[q])
> +        t.daemon = True
> +        t.start()
> +    q.join()
[snip]
> @@ -413,6 +514,34 @@ def dump_html_pkg(f, pkg):
>      # Current version
>      f.write("  <td class=\"centered\">%s</td>\n" % pkg.current_version)
>  
> +    # Latest version
> +    if pkg.latest_version[1] is None:
> +        td_class.append("version-unknown")
> +    elif pkg.latest_version[1] != pkg.current_version:
> +        td_class.append("version-needs-update")
> +    else:
> +        td_class.append("version-good")
> +
> +    if pkg.latest_version[1] is None:
> +        latest_version_text = "<b>Unknown</b>"
> +    else:
> +        latest_version_text = "<b>%s</b>" % str(pkg.latest_version[1])
> +
> +    latest_version_text += "<br/>"
> +
> +    if pkg.latest_version[2]:
> +        latest_version_text += "<a href=\"https://release-monitoring.org/project/%s\">link</a>, " % pkg.latest_version[2]
> +    else:
> +        latest_version_text += "no link, "
> +
> +    if pkg.latest_version[0]:
> +        latest_version_text += "has <a href=\"https://release-monitoring.org/distro/Buildroot/\">mapping</a>"
> +    else:
> +        latest_version_text += "has <a href=\"https://release-monitoring.org/distro/Buildroot/\">no mapping</a>"

If you don't think it gets too ugly, you could invert the text, putting
'mapping'/'no mapping' as the first cell text. It should make sorting by this
column to show all 'mapping' together and 'no mapping' together. I did not
tested this.

The other way (the correct way) is to implement custom sort keys
https://www.kryogenix.org/code/browser/sorttable/#customkeys
to be done later, of course.

> +
> +    f.write("  <td class=\"%s\">%s</td>\n" %
> +            (" ".join(td_class), latest_version_text))
> +
[snip]

Regards,
Ricardo
