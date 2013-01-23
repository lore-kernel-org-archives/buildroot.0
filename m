From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Wed, 23 Jan 2013 15:19:21 +0200
Subject: [Buildroot] [PATCH] pkg-infra: add documentation for
 <pkg>_CONFIG_FIXUP variable
In-Reply-To: <CAHXCMML5m19SwE=E4cOUKWWtMk0qYWjdUV49Vx_yuN895tawmw@mail.gmail.com>
References: <1358773906-30653-1-git-send-email-stefan.froberg@petroprogram.com>
 <CAHXCMML5m19SwE=E4cOUKWWtMk0qYWjdUV49Vx_yuN895tawmw@mail.gmail.com>
Message-ID: <50FFE359.9070004@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel

23.1.2013 0:54, Samuel Martin kirjoitti:
> Hi Stefan,
>
> Thanks for your work.
> My comments inlined.
>
> 2013/1/21 Stefan Fr?berg <stefan.froberg@petroprogram.com>:
>> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
>> ---
>>  docs/manual/adding-packages-generic.txt |   96 ++++++++++++++++++++++--------
>>  1 files changed, 70 insertions(+), 26 deletions(-)
>>
>> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
>> index 7b8561a..3b61031 100644
>> --- a/docs/manual/adding-packages-generic.txt
>> +++ b/docs/manual/adding-packages-generic.txt
> [...]
>> +34: define LIBFOO_PERMISSIONS
>> +35:    /bin/foo  f  4755  0  0  -  -  -  -  -
>> +36: endef
>> +37:
>>  37: $(eval $(generic-package))
> s/37/38/

Uups!

>>  --------------------------------
>>
>> @@ -69,7 +70,45 @@ install header files and other development files in the staging space.
>>  This will ensure that the commands listed in the
>>  +LIBFOO_INSTALL_STAGING_CMDS+ variable will be executed.
>>
>> -On line 12, we specify the list of dependencies this package relies
>> +On line 12, we specify that there is some fixing to be done to some
>> +of the 'libfoo-config' files that were installed during
>> ++LIBFOO_INSTALL_STAGING_CMDS+ phase.
>> +These *-config files are executable shell script files that are
>> +located in '$(STAGING_DIR)/usr/bin' directory and are executed
>> +by other 3rd party packages to find out the location and the linking
>> +flags of this particular package.
>> +
>> +The problem is that all these *-config files by default give wrong,
> s/,$//

No $ ? Ok.

>> +host system linking flags that are unsuitable for cross-compiling.
>> +
>> +For example:   '-I/usr/include' vs. '-I$(STAGING_DIR)/usr/include'
>> +or:            '-L/usr/lib' vs. '-L$(STAGING_DIR)/usr/lib'
> s/vs./instead of/
> imho, it's more obvious than "vs.", but i am not a native English speaker, so...

Then that makes it two of us :-)

>> +
>> +So some sed magic is done to these scripts to make them give correct
>> +flags.
>> +The argument to be given to +LIBFOO_CONFIG_FIXUP+ is the file name(s)
>> +of the shell script(s) needing fixing. All these names are relative to
>> +'$(STAGING_DIR)/usr/bin' and if needed multiple names can be given.
>> +
>> +Example 1:
>> +
>> +Package divine installs shell script '$(STAGING_DIR)/usr/bin/divine-config'.
>> +
>> +So it's fixup would be:
>> +
>> +DIVINE_CONFIG = divine-config
>> +
>> +Example 2:
>> +
>> +Package imagemagick installs the following scripts:
>> +'$(STAGING_DIR)/usr/bin/{Magick,Magick++,MagickCore,MagickWand,Wand}-config'
>> +
>> +So it's fixup would be:
>> +
>> +IMAGEMAGICK_CONFIG_FIXUP = Magick-config Magick++-config \
>> +                          MagickCore-config MagickWand-config Wand-config
> I really like this digression, it makes clearer how to use the
> *_CONFIG_FIXUP variable.

Thanks!

>> +
>> +On line 13, we specify the list of dependencies this package relies
>>  on. These dependencies are listed in terms of lower-case package names,
>>  which can be packages for the target (without the +host-+
>>  prefix) or packages for the host (with the +host-+) prefix).
>> @@ -240,6 +279,11 @@ information is (assuming the package name is +libfoo+) :
>>    variables are executed to install the package into the staging
>>    directory.
>>
>> +* +LIBFOO_CONFIG_FIXUP+ lists the names of the files in
>> +  '$(STAGING_DIR)/usr/bin' that need some special fixing to make them
>> +  cross-compiling friendly. Multiple file names separated by space can be
>> +  given and all are relative to '$(STAGING_DIR)/usr/bin'.
>> +
>>  * +LIBFOO_INSTALL_TARGET+ can be set to +YES+ (default) or +NO+. If
>>    set to +YES+, then the commands in the +LIBFOO_INSTALL_TARGET_CMDS+
>>    variables are executed to install the package into the target
>
> Regards,
>

No more typos?
Well, in that case I will fix those three things and resubmit it later
this evening.

Thanks for review Samuel!

Best Regards
Stefan
