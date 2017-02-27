From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 27 Feb 2017 06:43:40 +0200
Subject: [Buildroot] [PATCH] dependencies/cmake: blacklist cmake 3.7
In-Reply-To: <1488148967-8055-1-git-send-email-yann.morin.1998@free.fr>
References: <1488148967-8055-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20170227044340.mtawtne7hzbpt25o@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sun, Feb 26, 2017 at 11:42:47PM +0100, Yann E. MORIN wrote:
> cmake-3.7 has a bug in how it handles rpath, linking with libraries from
> the host.
> 
> Until we completely understand the issue, just blacklist cmake-3.7.
> 
> The issue has been reported upstream:
>     http://public.kitware.com/pipermail/cmake/2017-February/064970.html
> 
> Reported-by: Baruch Siach <baruch@tkos.co.il>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: J?rg Krause <joerg.krause@embedded.rocks>
> Cc: Ben Boeckel <mathstuf@gmail.com>
> Cc: Samuel Martin <s.martin49@gmail.com>
> ---
>  support/dependencies/check-host-cmake.sh | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/support/dependencies/check-host-cmake.sh b/support/dependencies/check-host-cmake.sh
> index 9b63b06..84c26c2 100755
> --- a/support/dependencies/check-host-cmake.sh
> +++ b/support/dependencies/check-host-cmake.sh
> @@ -6,6 +6,9 @@ version_min="${2}"
>  major_min="${version_min%.*}"
>  minor_min="${version_min#*.}"
>  
> +# cmake-3.7 incorrectly handles rpath, linking to host libraries
> +blacklist_version="3.7"
> +
>  cmake=`which ${candidate}`
>  if [ ! -x "${cmake}" ]; then
>      # echo nothing: no suitable cmake found
> @@ -27,6 +30,11 @@ version="$(${cmake} --version \
>  major="${version%.*}"
>  minor="${version#*.}"
>  
> +if [ "${version}" = "${blacklist_version}" ]; then

Minor nit: there are no quotes around version variables in the rest of this 
file.

> +    # echo nothing: no suitable cmake found
> +    exit 1
> +fi
> +
>  if [ ${major} -gt ${major_min} ]; then

E.g., here.

>      echo "${cmake}"
>  else

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
