From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Feb 2017 23:10:07 +0100
Subject: [Buildroot] [PATCH 0/4] package/cmake: revert the bump to 3.7
In-Reply-To: <20170225204439.2gqs2rnnmlrck22s@tarshish>
References: <cover.1488048682.git.yann.morin.1998@free.fr>
 <20170225204439.2gqs2rnnmlrck22s@tarshish>
Message-ID: <20170225221007.GF3627@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2017-02-25 22:44 +0200, Baruch Siach spake thusly:
> On Sat, Feb 25, 2017 at 07:51:29PM +0100, Yann E. MORIN wrote:
> > cmake 3.7 causes serious regressions in some cmake-based packages,
> > related to how RPATH is handled.
> > 
> > See for example:
> > 
> >   - domoticz : http://autobuild.buildroot.org/results/fd0/fd0ba54c7abf973691b39a0ca1bb4e07d749593a/
> >   - freerdp  : http://autobuild.buildroot.org/results/5d4/5d429d0e288754a541ee5d8be515454c5fccd28b/
> >   - libcec   : http://autobuild.buildroot.org/results/3f3/3f3593bab7734dd274faf5b5690895e9424cbb89/
> > 
> > (and many others)
> > 
> > All causes the link to be attemped against host libraries, which is
> > definitely not appropriate...
> > 
> > Properly fixing this so close to the release is problematic; we'd risk
> > having to hunt down packages one by one.
> 
> What about host installed cmake? Maybe do something like the following 
> (untested) to blacklist version 3.7.x?

Good catch, indeed.

> diff --git a/support/dependencies/check-host-cmake.sh b/support/dependencies/check-host-cmake.sh
> index 9b63b0648d97..1c4fec8cae41 100755
> --- a/support/dependencies/check-host-cmake.sh
> +++ b/support/dependencies/check-host-cmake.sh
> @@ -27,6 +27,10 @@ version="$(${cmake} --version \
>  major="${version%.*}"
>  minor="${version#*.}"
>  
> +if [ ${version} = 3.7 ]; then
> +	exit 1

Minor nit: the rest of the script uses leading spaces.

Also, we should probably catch >= 3.7, no?

Regards,
Yann E. MORIN.

> +fi
> +
>  if [ ${major} -gt ${major_min} ]; then
>      echo "${cmake}"
>  else
> 
> baruch
> 
> -- 
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
