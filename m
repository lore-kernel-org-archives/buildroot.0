From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Mar 2018 22:35:59 +0100
Subject: [Buildroot] [PATCH next v2 4/5] support/scripts/pkg-stats-new:
 add latest upstream version information
In-Reply-To: <5a961c197f405_484fb72dfc147d@ultri3.mail>
References: <20180221221342.15683-5-thomas.petazzoni@bootlin.com>
 <5a961c197f405_484fb72dfc147d@ultri3.mail>
Message-ID: <20180321223559.43b49d2f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 28 Feb 2018 00:03:53 -0300, Ricardo Martincoski wrote:

> When it hangs, by scrolling back I see (in a different place for the each run
> that hung):
> [snip]
>  [1453] python-autobahn => (False, None, None)
> Exception in thread Thread-6:
> Traceback (most recent call last):
>   File "/usr/lib/python2.7/threading.py", line 801, in __bootstrap_inner
>     self.run()
>   File "/usr/lib/python2.7/threading.py", line 754, in run
>     self.__target(*self.__args, **self.__kwargs)
>   File "support/scripts/pkg-stats-new", line 309, in get_version_worker
>     pkg.latest_version = get_latest_version(pkg.name)
>   File "support/scripts/pkg-stats-new", line 300, in get_latest_version
>     return get_latest_version_by_guess(package)
>   File "support/scripts/pkg-stats-new", line 282, in get_latest_version_by_guess
>     f = urllib2.urlopen(req)
>   File "/usr/lib/python2.7/urllib2.py", line 154, in urlopen
>     return opener.open(url, data, timeout)
>   File "/usr/lib/python2.7/urllib2.py", line 435, in open
>     response = meth(req, response)
>   File "/usr/lib/python2.7/urllib2.py", line 548, in http_response
>     'http', request, response, code, msg, hdrs)
>   File "/usr/lib/python2.7/urllib2.py", line 467, in error
>     result = self._call_chain(*args)
>   File "/usr/lib/python2.7/urllib2.py", line 407, in _call_chain
>     result = func(*args)
>   File "/usr/lib/python2.7/urllib2.py", line 654, in http_error_302
>     return self.parent.open(new, timeout=req.timeout)
>   File "/usr/lib/python2.7/urllib2.py", line 435, in open
>     response = meth(req, response)
>   File "/usr/lib/python2.7/urllib2.py", line 548, in http_response
>     'http', request, response, code, msg, hdrs)
>   File "/usr/lib/python2.7/urllib2.py", line 473, in error
>     return self._call_chain(*args)
>   File "/usr/lib/python2.7/urllib2.py", line 407, in _call_chain
>     result = func(*args)
>   File "/usr/lib/python2.7/urllib2.py", line 556, in http_error_default
>     raise HTTPError(req.get_full_url(), code, msg, hdrs, fp)
> HTTPError: HTTP Error 404: NOT FOUND
> 
>  [1452] cups-filters => (False, u'1.20.1', 5541)
> [snip]
>  [0001] python-flask-login => (False, None, None)
>  [0000] luabitop => (False, None, None)
>  [0000] python-pyopenssl => (False, None, None)
>  [0000] libsexy => (False, None, None)
>  [0000] libnetfilter_conntrack => (False, u'1.0.6', 1675)
>  [0000] doxygen => (False, u'1.8.14.windows.x64.bin', 457)
>  [0000] vdr-plugin-vnsiserver => (False, None, None)
> [hangs here, I waited 10 minutes]

I should have fixed this, will be in v3. I'm now handling exceptions in
all cases, and I've added a timeout on the urllib2.urlopen() calls, that
will make it abort after 15 seconds if the HTTP request has not
returned.

This will allow to make sure the script terminates properly. However,
it means that the result of the script may be different from one run to
the other, as the HTTP request for a given package may sometimes take
more than 15 seconds, sometimes not.

I guess this is a good enough trade-off, until upstream provides us a
better way of retrieving the data.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
