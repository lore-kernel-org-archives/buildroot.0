From: vj <vicencb@gmail.com>
Date: Fri, 21 Aug 2015 18:56:31 +0100
Subject: [Buildroot] [RFC 00/37] efl bump to 1.14.2
In-Reply-To: <55D6F4A8.3000104@openwide.fr>
References: <CAAMcf8CO9XsiTBOJX3APO+ZXtyPLDZmHq2EU0LPT3UXKhTC-=g@mail.gmail.com>
 <55D6F4A8.3000104@openwide.fr>
Message-ID: <CAAMcf8COScfy62sEC4uPKHw=LgyLWWtic9ypCF0DZMfu21hzdg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Romain,

On Fri, Aug 21, 2015 at 10:51 AM, Romain Naour <romain.naour@openwide.fr> wrote:
> Hi Vicente,
>
> Le 21/08/2015 02:30, vj a ?crit :
>> Hello Romain,
>> I've tested you efl update
>> https://github.com/RomainNaour/buildroot/tree/efl-1.15.0-v1
>> It did not work, :(
>> But applying the two patches below works again!
>> The first one was already commented in a previous e-mail.
>
> Yes, sorry I haven't looked at your issue yet.
>
> libmount seems to be optional and can be disabled with --disable-libmount:
> https://github.com/RomainNaour/buildroot/blob/efl-1.15.0-v1/package/efl/efl.mk#L35

Without that dependency it failed with 1.14.2.
When I saw the dependency was not there in 1.15.0, I just added it
again without checking.
Just now I've tried it again without that patch and it's fine, so, you
can forget it.
Sorry for the hassle.

>
> But since it's not recommended to disable it, I'll apply your patch :)
>
>> The second is related to a regression in efl-1.15.0.
>
> Can you report your issue to the efl mailing list ?

I know it would be better to have it fixed upstream, but have no time
for that now.
If you would like to, feel free to report it.
To debug it, it helps enabling the WRN and DGB macros in eina_module.c.

>
>> The testing I've done has been with the musl libc and with
>> BR2_PACKAGE_EFL_RECOMMENDED_CONFIG unset.
>> Basically the same config as in the previous e-mail.
>>
>> A minor issue: check the spelling of recommanded.
>
> Ha indeed recommanded is used in Config.in prompt
> (my French was turned on sorry ;-) )
>
> Thanks for testing!

Thanks for adding musl and maintaining efl!

>
> Best regards,
> Romain
>>
>> Regards,
>>   Vicente.
>>
>> --
>>
>> In-Reply-To=<55C31E99.8010002@openwide.fr>
Tested-by: Vicente Bergas <vicencb@gmail.com>
>> --
>>
>> diff --git a/package/efl/Config.in b/package/efl/Config.in
>> index 3de717f..8cc0f91 100644
>> --- a/package/efl/Config.in
>> +++ b/package/efl/Config.in
>> @@ -11,6 +11,8 @@ config BR2_PACKAGE_EFL
>>      select BR2_PACKAGE_JPEG # Emile needs libjpeg
>>      select BR2_PACKAGE_LIBCURL # eina_module, runtime dependency
>>      select BR2_PACKAGE_LUA # Evas lua 5.1 or 5.2
>> +    select BR2_PACKAGE_UTIL_LINUX
>> +    select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
>>      select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_WAYLAND
>>      help
>>        Enlightenment Foundation Libraries
>>
>>
>>
>> diff --git a/package/efl/efl.mk b/package/efl/efl.mk
>> index 2d29375..d785efc 100644
>> --- a/package/efl/efl.mk
>> +++ b/package/efl/efl.mk
>> @@ -15,6 +15,11 @@ EFL_INSTALL_STAGING = YES
>>  EFL_DEPENDENCIES = host-pkgconf host-efl dbus freetype jpeg libcurl lua udev \
>>      zlib
>>
>> +# In 1.15.0 there is a regression with missing symbols,
>> +# at least when trying to load the fb module.
>> +# Making all symbols visible by default fixes the problem.
>> +EFL_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -fvisibility=default"
>> +
>>  # Configure options:
>>  # --disable-cxx-bindings: disable C++11 bindings.
>>  # --enable-lua-old: disable Elua and remove luajit dependency.
>>
>
