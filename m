From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 3 Dec 2019 20:36:17 +0100
Subject: [Buildroot] [PATCH] utils/genrandconfig: fix runtime issue with
 Python 3
In-Reply-To: <20191203165137.1100010-1-thomas.petazzoni@bootlin.com>
References: <20191203165137.1100010-1-thomas.petazzoni@bootlin.com>
Message-ID: <1a56a5b4-e64b-3844-7352-d12c6407585b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/12/2019 17:51, Thomas Petazzoni wrote:
> With Python 3.7, genrandconfig fails with:
> 
> 'str' object has no attribute 'decode'
> 
> We are already working on str objects, and there is no need to decode
> them, so we drop the call to decode_byte_list() and its definition as
> it was only used there.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> This is of course very strange, as the decode_byte_list() function was
> introduced specifically to handle Python 3.x. Does anyone has an
> explanation?

 Just guessing here, but: originally this file was downloaded with
urlopen_closing() instead of being read from a local file. Since we only use
genrandconfig in the autobuilders in python2 (cfr. the shebang), nobody noticed
that this broke when I switched to reading from file instead of URL two years
ago (84929a53a4).

 Regards,
 Arnout

> ---
>  utils/genrandconfig | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/utils/genrandconfig b/utils/genrandconfig
> index fb28f4d356..5b60bc21d6 100755
> --- a/utils/genrandconfig
> +++ b/utils/genrandconfig
> @@ -39,14 +39,6 @@ def urlopen_closing(uri):
>      return contextlib.closing(_urllib.urlopen(uri))
>  
>  
> -if sys.hexversion >= 0x3000000:
> -    def decode_byte_list(bl):
> -        return [b.decode() for b in bl]
> -else:
> -    def decode_byte_list(e):
> -        return e
> -
> -
>  class SystemInfo:
>      DEFAULT_NEEDED_PROGS = ["make", "git", "gcc", "timeout"]
>      DEFAULT_OPTIONAL_PROGS = ["bzr", "java", "javac", "jar", "diffoscope"]
> @@ -128,7 +120,7 @@ def get_toolchain_configs(toolchains_csv, buildrootdir):
>      with open(toolchains_csv) as r:
>          # filter empty lines and comments
>          lines = [t for t in r.readlines() if len(t.strip()) > 0 and t[0] != '#']
> -        toolchains = decode_byte_list(lines)
> +        toolchains = lines
>      configs = []
>  
>      (_, _, _, _, hostarch) = os.uname()
> 
