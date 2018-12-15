From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 15 Dec 2018 22:42:09 +0200
Subject: [Buildroot] [PATCH 1/1] dependencies.sh: Check for a host
 python version >= 2.7
In-Reply-To: <20181215202937.81372-1-aduskett@gmail.com>
References: <20181215202937.81372-1-aduskett@gmail.com>
Message-ID: <871s6ibjz2.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam,

aduskett at gmail.com writes:
> From: Adam Duskett <Aduskett@gmail.com>
>
> Older distributions such as CentOS6 come with python2.6, which causes build
> failures in packages such as host-libglib2 because they require python2.7 or
> above.

Any reference to glib requirements? autobuilder failures?

> CentOS6 does have the centos-release-scl which allows users to install
> python2.7, making this transition reasonably easy.
>
> Debian 6 and 7 have reached EOL, and Debian 8 comes with Python 2.7, so
> this patch should be relatively low impact.

Please update the requirements documentation in a separate patch:

  https://buildroot.org/downloads/manual/manual.html#requirement-mandatory

baruch

> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  support/dependencies/dependencies.sh | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
> index 58c34d880f..d0b6bdc23a 100755
> --- a/support/dependencies/dependencies.sh
> +++ b/support/dependencies/dependencies.sh
> @@ -181,6 +181,14 @@ if test "${missing_progs}" = "yes" ; then
>  	exit 1
>  fi
>  
> +# Check that the python version is at least 2.7
> +PYTHON_VERSION=$(python -V 2>&1 |awk '{print $2}')
> +if [ $(echo $PYTHON_VERSION |sed -e 's/\.//g') -lt 2700 ]; then
> +	echo
> +	echo "You have python '$PYTHON_VERSION' installed.  Python >= 2.7 is required"
> +	exit 1;
> +fi
> +
>  if grep ^BR2_NEEDS_HOST_UTF8_LOCALE=y $BR2_CONFIG > /dev/null; then
>  	if ! which locale > /dev/null ; then
>  		echo

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
