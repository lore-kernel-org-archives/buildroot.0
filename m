From: ratbert90 <aduskett@gmail.com>
Date: Mon, 17 Dec 2018 08:10:54 -0500
Subject: [Buildroot] [PATCH v3 1/2] dependencies.sh: Check for a host
 python version >= 2.7
In-Reply-To: <20181217082836.72eff0aa@gmx.net>
References: <20181216232734.100068-1-aduskett@gmail.com>
 <20181217082836.72eff0aa@gmx.net>
Message-ID: <2B863C9D-397E-4EED-B47D-1E08D4D45741@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter;

I would question as to why we would do anything to support such an old version of Python that was EOLed over 5 years ago.  Heck, even 2.7 will be EOLed in 2020.

Looking around, the only distribution that has 2.6 that still has any kind of support is CentOS6, and even that is in maintenance mode. 

2.7 is a safe bet in my opinion. 

Adam

> On Dec 17, 2018, at 2:28 AM, Peter Seiderer <ps.report@gmx.net> wrote:
> 
> Hello Adam,
> 
>> On Sun, 16 Dec 2018 18:27:33 -0500, aduskett at gmail.com wrote:
>> 
>> From: Adam Duskett <Aduskett@gmail.com>
>> 
>> Older distributions such as CentOS6 come with python2.6, which causes build
>> failures in packages such as host-libglib2 because they require python2.7 and
>> above.
>> 
>> host-libglib2 will produce the error message:
>> /bin/sh: python2.7: command not found
>> 
>> Python2.7 is a hard-coded value in configure.ac. If one changes the value to
>> just "python," the following stack trace is produced:
>> 
>> Traceback (most recent call last):
>>  File "./gdbus-2.0/codegen/gdbus-codegen.in", line 55, in <module>
>>    self.outfile.write(LICENSE_STR.format(config.VERSION))
>> ValueError    : sys.exit(codegen_main.codegen_main())
>> zero length field name in format
>> 
> 
> Or avoid the python call (used only for re-generation of already delivered files)
> by patching libglib2 (fixes the libglib2 build in case of python2.7 without
> proper xml.parsers.expat installation):
> 
> diff --git a/gio/Makefile.am b/gio/Makefile.am
> index 3039e00..b7ba228 100644
> --- a/gio/Makefile.am
> +++ b/gio/Makefile.am
> @@ -101,7 +101,7 @@ GDBUS_PYTHON_DEPS =                    \
>    $(builddir)/gdbus-2.0/codegen/config.py    \
>    $(srcdir)/gdbus-2.0/codegen/utils.py
> 
> -gdbus-daemon-generated.h gdbus-daemon-generated.c: $(srcdir)/dbus-daemon.xml $(GDBUS_PYTHON_DEPS)
> +gdbus-daemon-generated.h gdbus-daemon-generated.c: $(srcdir)/dbus-daemon.xml
>    $(AM_V_GEN) UNINSTALLED_GLIB_SRCDIR=$(top_srcdir) \
>        UNINSTALLED_GLIB_BUILDDIR=$(top_builddir) \
>        $(PYTHON) $(srcdir)/gdbus-2.0/codegen/gdbus-codegen.in \
> 
> Regards,
> Peter
> 
>> Instead of supporting an ancient version of Python that had its support ended
>> in October os 2013, it would be more pragmatic only to support Python2.7 and
>> above.
>> 
>> Luckily; CentOS6 has the centos-release-scl repository, which allows users to
>> install python2.7, and Debian 8 comes with Python2.7 already, making this patch
>> relatively low impact.
>> 
>> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
>> ---
>> Changes v1 -> v2:
>>  - Updated version requirement in prerequisite.txt
>> 
>> Changes v2 -> v3:
>>  - Added more precise language to the commit message.
>>  - Added an example stack trace and error caused by python2.6 and
>>    host-libglib2.
>> 
>> support/dependencies/dependencies.sh | 8 ++++++++
>> 1 file changed, 8 insertions(+)
>> 
>> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
>> index 58c34d880f..d0b6bdc23a 100755
>> --- a/support/dependencies/dependencies.sh
>> +++ b/support/dependencies/dependencies.sh
>> @@ -181,6 +181,14 @@ if test "${missing_progs}" = "yes" ; then
>>    exit 1
>> fi
>> 
>> +# Check that the python version is at least 2.7
>> +PYTHON_VERSION=$(python -V 2>&1 |awk '{print $2}')
>> +if [ $(echo $PYTHON_VERSION |sed -e 's/\.//g') -lt 2700 ]; then
>> +    echo
>> +    echo "You have python '$PYTHON_VERSION' installed.  Python >= 2.7 is required"
>> +    exit 1;
>> +fi
>> +
>> if grep ^BR2_NEEDS_HOST_UTF8_LOCALE=y $BR2_CONFIG > /dev/null; then
>>    if ! which locale > /dev/null ; then
>>        echo
> 
