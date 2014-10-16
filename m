From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Date: Thu, 16 Oct 2014 10:32:11 -0400
Subject: [Buildroot] [PATCH 1/1] yaml-cpp: Added package
In-Reply-To: <20141016105005.5e3fffbd@free-electrons.com>
References: <1413406053-22668-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
 <20141016105005.5e3fffbd@free-electrons.com>
Message-ID: <543FD6EB.5070203@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks for your review.
I will send a new patch later.

Regards,
Sebastien Bourdelin.

On 10/16/2014 04:50 AM, Thomas Petazzoni wrote:
> Dear Sebastien Bourdelin,
>
> Title should rather be "yaml-cpp: new package", as per the convention
> we use for most commits introducing new packages.
>
> On Wed, 15 Oct 2014 16:47:33 -0400, Sebastien Bourdelin wrote:
>> yaml-cpp is a YAML parser and emitter in C++ matching
>> the YAML 1.2 spec.
>>
>> https://code.google.com/p/yaml-cpp/
>> Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
> There should be an empty new line before the SoB line.
>
>> diff --git a/package/Config.in b/package/Config.in
>> index 93e148d..40a1b1c 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -898,6 +898,7 @@ menu "Other"
>>  	source "package/startup-notification/Config.in"
>>  	source "package/tz/Config.in"
>>  	source "package/tzdata/Config.in"
>> +	source "package/yaml-cpp/Config.in"
> I don't think it's the right place for this. It should be in
> "Libraries" -> "XML/JSON", because this is where the libyaml package
> is. Of course, yaml is technically not XML or JSON, but still.
>
>> diff --git a/package/yaml-cpp/Config.in b/package/yaml-cpp/Config.in
>> new file mode 100644
>> index 0000000..fcfd60f
>> --- /dev/null
>> +++ b/package/yaml-cpp/Config.in
>> @@ -0,0 +1,14 @@
>> +config BR2_PACKAGE_YAML_CPP
>> +	bool "yaml-cpp"
>> +	depends on BR2_INSTALL_LIBSTDCPP
>> +	depends on BR2_LARGEFILE
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>> +	select BR2_PACKAGE_BOOST
>> +	help
>> +	  yaml-cpp is a YAML parser and emitter in C++ matching
>> +	  the YAML 1.2 spec.
>> +
>> +	  https://code.google.com/p/yaml-cpp/
>> +
>> +comment "yaml-cpp needs a toolchain w/ C++, largefile, threads"
>> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
>> diff --git a/package/yaml-cpp/yaml-cpp.hash b/package/yaml-cpp/yaml-cpp.hash
>> new file mode 100644
>> index 0000000..391e317
>> --- /dev/null
>> +++ b/package/yaml-cpp/yaml-cpp.hash
>> @@ -0,0 +1,5 @@
>> +# hash from: https://yaml-cpp.googlecode.com/files/yaml-cpp-0.5.1.tar.gz:
>> +sha1 9c5414b4090491e96d1b808fe8628b31e625fdaa  yaml-cpp-0.5.1.tar.gz
>> +
>> +# Locally calculated:
>> +sha256 3e7c9052b43d987d41819a203d97fc45de4eed3ec67e0fdb14265c3d11046f06  yaml-cpp-0.5.1.tar.gz
>> diff --git a/package/yaml-cpp/yaml-cpp.mk b/package/yaml-cpp/yaml-cpp.mk
>> new file mode 100644
>> index 0000000..324ea58
>> --- /dev/null
>> +++ b/package/yaml-cpp/yaml-cpp.mk
>> @@ -0,0 +1,14 @@
>> +################################################################################
>> +#
>> +# yaml-cpp
>> +#
>> +################################################################################
>> +
>> +YAML_CPP_VERSION = yaml-cpp-0.5.1
>> +YAML_CPP_SOURCE = $(YAML_CPP_VERSION).tar.gz
> You should rather do:
>
> YAML_CPP_VERSION = 0.5.1
>
> and not specify any YAML_CPP_SOURCE at all.
>
>> +YAML_CPP_SITE = https://yaml-cpp.googlecode.com/files
>> +YAML_CPP_INSTALL_STAGING = YES
>> +YAML_CPP_LICENSE = MIT
>> +YAML_CPP_LICENSE_FILES = license.txt
> The license information looks ok.
>
>> +
>> +$(eval $(cmake-package))
> Could you submit an updated version with those minor changes taken into
> account? Other than those comments, I believe the package is good to go!
>
> Thomas
