From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Oct 2014 00:20:09 +0200
Subject: [Buildroot] [PATCH buildroot-test 1/8] autobuild-run:
 check-requirements does not need to know the login details
In-Reply-To: <1413486964-5183-1-git-send-email-patrickdepinguin@gmail.com>
References: <1413486964-5183-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20141017222009.GQ3971@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-10-16 21:15 +0200, Thomas De Schampheleire spake thusly:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> check-requirements simply has to know if the results have to be sent, so
> it can check on some extra requirements. The username and password are
> irrelevant here.
> This commit introduces a boolean variable do_send_results to hide these
> details.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> ---
>  scripts/autobuild-run | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index 7497001..2ead1f2 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -85,12 +85,12 @@ def check_version():
>          print "ERROR: script version too old, please upgrade."
>          sys.exit(1)
>  
> -def check_requirements(http_login, http_password):
> +def check_requirements(do_send_results=False):
>      devnull = open(os.devnull, "w")
>      needed_progs = ["make", "git", "gcc", "timeout"]
>      missing_requirements = False
>  
> -    if http_login and http_password:
> +    if do_send_results:
>          needed_progs.append("curl")
>  
>      for prog in needed_progs:
> @@ -553,8 +553,9 @@ if __name__ == '__main__':
>      check_version()
>      sysinfo = SystemInfo()
>      (ninstances, njobs, http_login, http_password, submitter) = config_get()
> -    check_requirements(http_login, http_password)
> -    if http_login is None or http_password is None:
> +    do_send_results = http_login and http_password

I was told that we should no treat 'None' as 'False', or a non-empty
string as 'True'. This should be something like:

    do_send_results = (not http_login is None) and (not http_password is None)

Regards,
Yann E. MORIN.

> +    check_requirements(do_send_results)
> +    if not do_send_results:
>          print "WARN: due to the lack of http login/password details, results will not be submitted"
>          print "WARN: tarballs of results will be kept locally only"
>      def sigterm_handler(signum, frame):
> -- 
> 1.8.5.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
