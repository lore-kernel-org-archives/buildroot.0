From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Jun 2019 19:11:57 +0200
Subject: [Buildroot] [PATCH buildroot-test 1/2] scripts/autobuild-run:
 make the HTTP URL really configurable
In-Reply-To: <20190617182236.23918-1-thomas.petazzoni@bootlin.com>
References: <20190617182236.23918-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190622171157.GE13664@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-06-17 20:22 +0200, Thomas Petazzoni spake thusly:
> The --http-url option allowed to customize the URL at which build
> results are submitted. However, there were two other places in the
> script where autobuild.buildroot.org was hardcoded: when checking the
> script version, and when getting the list of branches to build.
> 
> This commit changes the --http-url to be the base URL of the autobuild
> server, and it is used everywhere instead of hardcoding
> autobuild.buildroot.org.
> 
> Note: users of autobuild-run that were passing a custom --http-url
> option such as http://foo.com/submit/ should change it to just
> http://foo.com/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
[--SNIP--]
> @@ -178,23 +179,23 @@ def log_write(logf, msg):
>      logf.write("[%s] %s\n" % (strftime("%a, %d %b %Y %H:%M:%S", localtime()), msg))
>      logf.flush()
>  
> -def check_version():
> -    with urlopen_closing('http://autobuild.buildroot.org/version') as r:
> +def check_version(**kwargs):

There is a current work by Atharva to actually remove usage of kwargs
elsewhere in the code.

I think it would be nice to have a new object that contains the server
config:

    class ServerConfig():
        def __init__(self, base_url):
            self.base_url = base_url
        def branches_url(self):
            return urlparse.urljoin(self.base_url, 'branches')
        def submit_url(self):
            return urlparse.urljoin(self.base_url, 'submit')

And then in main (or elsewhere it is meaningful):

    server_cfg = ServerConfig(args['http_url'])

and pass that object to run_instance().

Then the series from Atharva can more easily account for this new
variable.

Regards,
Yann E. MORIN.

> +    with urlopen_closing(urlparse.urljoin(kwargs['http_url'], 'version')) as r:
>          version = int(decode_bytes(r.readline()).strip())
>      if version > VERSION:
>          print("ERROR: script version too old, please upgrade.")
>          sys.exit(1)
>  
> -def get_branch():
> +def get_branch(**kwargs):
>      """Returns the branch that should be built. It fetches a CSV file from
> -    autobuild.buildroot.org that provides the list of branches to test
> +    the autobuild server that provides the list of branches to test
>      (first field) and their weight (second field). We build a list of
>      branches, where the branch name is repeated N times, with N being
>      the weight of the branch. We then pick a random branch in this
>      list. This way, branches with a higher weight are more likely to
>      be selected.
>      """
> -    with urlopen_closing('http://autobuild.buildroot.org/branches') as r:
> +    with urlopen_closing(urlparse.urljoin(kwargs['http_url'], 'branches')) as r:
>          csv_branches = r.readlines()
>      branches = []
>      for branch in csv.reader(csv_branches):
> @@ -314,7 +315,7 @@ def prepare_build(**kwargs):
>                    os.path.relpath(f, dldir))
>          os.remove(f)
>  
> -    branch = get_branch()
> +    branch = get_branch(**kwargs)
>      log_write(log, "INFO: testing branch '%s'" % branch)
>  
>      # Clone Buildroot. This only happens if the source directory
> @@ -679,7 +680,7 @@ def send_results(result, **kwargs):
>                                 "-H", "Expect:",
>                                 "-F", "uploadedfile=@%s" % os.path.join(outputdir, "results.tar.bz2"),
>                                 "-F", "uploadsubmit=1",
> -                               kwargs['http_url']],
> +                               urlparse.urljoin(kwargs['http_url'], 'submit/')],
>                                stdout=log, stderr=log)
>          if ret != 0:
>              log_write(log, "INFO: results could not be submitted, %d" % ret)
> @@ -713,7 +714,7 @@ def run_instance(**kwargs):
>      log_write(kwargs['log'], "INFO: instance started")
>  
>      while True:
> -        check_version()
> +        check_version(**kwargs)
>  
>          ret = prepare_build(**kwargs)
>          if ret != 0:
> @@ -774,7 +775,6 @@ def main():
>      # showing error messages in another language.
>      os.environ['LC_ALL'] = 'C'
>  
> -    check_version()
>      sysinfo = SystemInfo()
>  
>      args = docopt.docopt(doc, version=VERSION)
> -- 
> 2.21.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
