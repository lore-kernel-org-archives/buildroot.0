From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 5 Mar 2015 12:44:38 +0100
Subject: [Buildroot] [PATCH] package/mono-gtksharp: new package
In-Reply-To: <54F79F86.90108@mind.be>
References: <1423908982-23475-1-git-send-email-angelo.compagnucci@gmail.com>
 <54F79F86.90108@mind.be>
Message-ID: <CA+TH9VmkD+8yfdhxcf1yPoStPuK8bGkWj6T-GRJpxDPc+Ku0-w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

2015-03-05 1:12 GMT+01:00 Arnout Vandecappelle <arnout@mind.be>:
> On 14/02/15 11:16, Angelo Compagnucci wrote:
>> This patch adds gtksharp package for mono.
>>
>> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>
> Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
> A few comments below, but nothing obligatory.
>
>> ---
>>
>> Changes: I superseeded previous patch to adhere the package naming, so
>> gtksharp becames mono-gtksharp.
>>
>>  package/Config.in                      |  5 +++++
>>  package/mono-gtksharp/Config.in        |  7 +++++++
>>  package/mono-gtksharp/mono-gtksharp.mk | 16 ++++++++++++++++
>>  3 files changed, 28 insertions(+)
>>  create mode 100644 package/mono-gtksharp/Config.in
>>  create mode 100644 package/mono-gtksharp/mono-gtksharp.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index fe3d3d0..fbba20c 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -464,6 +464,11 @@ menu "Lua libraries/modules"
>>  endmenu
>>  endif
>>       source "package/mono/Config.in"
>> +if BR2_PACKAGE_MONO
>> +menu "Mono libraries/modules"
>> +     source "package/mono-gtksharp/Config.in"
>> +endmenu
>> +endif
>>       source "package/nodejs/Config.in"
>>       source "package/perl/Config.in"
>>  if BR2_PACKAGE_PERL
>> diff --git a/package/mono-gtksharp/Config.in b/package/mono-gtksharp/Config.in
>> new file mode 100644
>> index 0000000..b3f16f0
>> --- /dev/null
>> +++ b/package/mono-gtksharp/Config.in
>> @@ -0,0 +1,7 @@
>> +config BR2_PACKAGE_MONO_GTKSHARP
>> +     bool "gtk#"
>> +     depends on BR2_PACKAGE_LIBGTK3
>
>  I think it would be appropriate to select libgtk3 rather than depending on it.
>
>> +     help
>> +       Gtk# is a .NET language binding for the GTK+ toolkit.
>
>  Perhaps mention that it's GTK3.

Yes, you are right, probably it's best to name it gtk3.

>
>> +
>> +       http://www.mono-project.com/docs/gui/gtksharp/
>> diff --git a/package/mono-gtksharp/mono-gtksharp.mk b/package/mono-gtksharp/mono-gtksharp.mk
>> new file mode 100644
>> index 0000000..58412eb
>> --- /dev/null
>> +++ b/package/mono-gtksharp/mono-gtksharp.mk
>> @@ -0,0 +1,16 @@
>> +################################################################################
>> +#
>> +# gtksharp
>> +#
>> +################################################################################
>> +
>> +MONO_GTKSHARP_VERSION_MAJOR = 2.99
>> +MONO_GTKSHARP_VERSION = $(MONO_GTKSHARP_VERSION_MAJOR).3
>
>  We normally prefer stable releases rather than beta releases, so that would be
> 2.12.25. However, that release still uses gtk2 rather than gtk3, so it does make
> complete sense to me to go for the beta.

There are not stable releases of gtk#3, everyone uses the beta one,
it's the de facto version.

>> +MONO_GTKSHARP_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk-sharp/$(MONO_GTKSHARP_VERSION_MAJOR)/
>> +MONO_GTKSHARP_SOURCE = gtk-sharp-$(MONO_GTKSHARP_VERSION).tar.xz
>> +MONO_GTKSHARP_LICENSE = LGPLv2
>
>  A few files, in particular all of the cairo library, is MIT rather than LGPLv2.
> The others are combined with LGPLv2 code in a single DLL so LGPLv2 is correct,
> but the cairo library is a separate DLL that doesn't seem to depend on any other
> gtksharp library, so I'd make that
>
> MONO_GTKSHARP_LICENSE = LGPLv2, MIT (cairo)

I don't think there are cairo files distributed with mono, the cairo
folder contains a c# wrapper to cairo, but it's original code. Can you
point me to the offending files?

>> +MONO_GTKSHARP_LICENSE_FILES = COPYING
>> +MONO_GTKSHARP_INSTALL_STAGING = YES
>> +MONO_GTKSHARP_DEPENDENCIES = mono libgtk3
>> +
>> +$(eval $(autotools-package))
>>
>
>  Perhaps add a hash file?
>
> # sha256 from
> https://download.gnome.org/sources/gtk-sharp/2.99/gtk-sharp-2.99.3.sha256sum
> sha256  6440f571416267ae0cb5698071d087b31e3084693fa2c829b1db37ca7ea2c3a2
> gtk-sharp-2.99.3.tar.xz

Sure!

>
>
>
>  Regards,
>  Arnout
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
