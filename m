From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 2 Jul 2019 00:33:03 +0200
Subject: [Buildroot] [PATCH 26/27] scripts/autobuild-run: make the HTTP
 URL really configurable
In-Reply-To: <20190629050214.17852-26-itsatharva@gmail.com>
References: <20190629050214.17852-1-itsatharva@gmail.com>
 <20190629050214.17852-26-itsatharva@gmail.com>
Message-ID: <f944536c-a2e5-6374-ae16-f07e8634ce36@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/06/2019 07:02, Atharva Lele wrote:
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
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
> [Atharva: Adapted Thomas' patches to work with Builder class]
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 It would have been more appropriate as patch 23, however, because it's related
to patches 21 and 22.

 Regards,
 Arnout

> ---
> Changes v1 -> v2:
>   - Incorporate Thomas' patch into Builder class series
> ---
>  scripts/autobuild-run | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index 9051297..d92e977 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -66,7 +66,7 @@ defaults = {
>      '--make-opts': '',
>      '--nice': 0,
>      '--pid-file': '/tmp/buildroot-autobuild.pid',
> -    '--http-url': 'http://autobuild.buildroot.org/submit/',
> +    '--http-url': 'http://autobuild.buildroot.org/',
>      '--toolchains-csv': 'support/config-fragments/autobuild/toolchain-configs.csv',
>      '--repo': 'https://github.com/buildroot/buildroot.git',
>  }
> @@ -145,6 +145,7 @@ from distutils.version import StrictVersion
>  import platform
>  from threading import Thread, Event
>  import datetime
> +import urlparse
>  
>  if sys.hexversion >= 0x3000000:
>      import configparser
> @@ -283,7 +284,7 @@ class Builder:
>              self.log = open(os.path.join(self.idir, "instance.log"), "a+")
>  
>      def check_version(self):
> -        with urlopen_closing('http://autobuild.buildroot.org/version') as r:
> +        with urlopen_closing(urlparse.urljoin(self.http_url, 'version')) as r:
>              version = int(decode_bytes(r.readline()).strip())
>          if version > VERSION:
>              print("ERROR: script version too old, please upgrade.")
> @@ -291,14 +292,14 @@ class Builder:
>  
>      def get_branch(self):
>          """Returns the branch that should be built. It fetches a CSV file from
> -        autobuild.buildroot.org that provides the list of branches to test
> +        the autobuild server that provides the list of branches to test
>          (first field) and their weight (second field). We build a list of
>          branches, where the branch name is repeated N times, with N being
>          the weight of the branch. We then pick a random branch in this
>          list. This way, branches with a higher weight are more likely to
>          be selected.
>          """
> -        with urlopen_closing('http://autobuild.buildroot.org/branches') as r:
> +        with urlopen_closing(urlparse.urljoin(self.http_url, 'branches')) as r:
>              csv_branches = r.readlines()
>          branches = []
>          for branch in csv.reader(csv_branches):
> @@ -692,7 +693,7 @@ class Builder:
>                                     "-H", "Expect:",
>                                     "-F", "uploadedfile=@%s" % os.path.join(self.outputdir, "results.tar.bz2"),
>                                     "-F", "uploadsubmit=1",
> -                                   self.http_url],
> +                                   urlparse.urljoin(self.http_url, 'submit/')],
>                                     stdout=self.log, stderr=self.log)
>              if ret != 0:
>                  log_write(self.log, "INFO: results could not be submitted, %d" % ret)
> 
