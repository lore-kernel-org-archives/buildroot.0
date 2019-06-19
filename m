From: Victor Huesca <victor.huesca@bootlin.com>
Date: Wed, 19 Jun 2019 17:35:42 +0200
Subject: [Buildroot] [PATCH 0/4] Sanetize packages version
In-Reply-To: <20190612165020.441113ee@windsurf>
References: <20190612064209.23619-1-victor.huesca@bootlin.com>
 <20190612092624.1ca7836d@windsurf>
 <627e16bb-a937-a00e-7d03-7373c69433ca@bootlin.com>
 <20190612165020.441113ee@windsurf>
Message-ID: <a5f09272-46f4-5092-8f4f-12d319b7266c@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le 12/06/2019 ? 16:50, Thomas Petazzoni a ?crit?:
> 
> On Wed, 12 Jun 2019 10:39:18 +0200
> Victor Huesca <victor.huesca@bootlin.com> wrote:
>>>>
>>>> Also, there are a few packages that use the <pkg>_VERSION variable to store
>>>> more than just the version. For example gap-madam-bin-maxi have a suffix  
>>>
>>> I don't see a gap-madam-bin-maxi package in Buildroot. I am missing
>>> something ?  
>>
>> Oupsy, I don't know what appended here, I meant the gpu-amd-bin-mx51
>> subpackage of freescale-imx which is suffixed by either "-fb" or "-x11".
> 
> For this one, I believe it is a mistake for the "version" to contain
> -fb or -x11, the package should do this:
> 
> GPU_AMD_BIN_MX51_VERSION = 11.09.01
> ifeq ($(BR2_PACKAGE_GPU_AMD_BIN_MX51_OUTPUT_FB),y)
> GPU_AMD_BIN_MX51_SOURCE = amd-gpu-bin-mx51-$(GPU_AMD_BIN_MX51_VERSION)-fb.bin
> else
> GPU_AMD_BIN_MX51_SOURCE = amd-gpu-x11-bin-mx51-$(GPU_AMD_BIN_MX51_VERSION)-x11.bin
> GPU_AMD_BIN_MX51_DEPENDENCIES = libxcb xlib_libX11 xlib_libXext \
>         xlib_libXrender xlib_libXau xlib_libXdmcp
> endif

Ok, this one is fairly easy to fix but some package are less obvious.

Here is a list of the different packages I found that does have a
prefix/suffix in their _VERSION variable, for most of them I'm not sure
if the prefix/suffix should be consider part of the version, any opinion
on it?

- android-tools:        4.2.2+git20130218
The downloaded version is fetch from launchpad, the RM version
corresponds to the android version because sources for this tool are not
distributed alone.

- bandwidthd:           2.0.1-auto-r11
The downloaded version is not the original bandwithd but a fork that
uses automake, this fork appends -auto-rXX to the actual version.

- imx-alsa-plugins:     rel_imx_4.9.x_1.0.0_ga
- imx-mkimage:          rel_imx_4.14.78_1.0.0_ga
I The 4.9.x seems to be related to freescale but I'm not sure about the
*_ga suffix.


- luarocks fetched packages: luasql-0.2.2.1-1
A large amount of lua packages have a -1 suffix. This suffix is not
present on release-monitoring, so I think we should remove it.
The thing is: the `luarocks-package` function seems to use the
<pkg>_VERSION variable.
Remove suffix for those packages will probably require to modify a bit
the way luarocks packages are handle.

If we achieve to modify these packages, the only packages left would be
those with a commit id as version.


>>> Kodi has two different entries in release-monitoring.org:
>>>
>>>  https://release-monitoring.org/project/5511/, which has only the
>>>  version, but seems to be outdated
>>>
>>>   https://release-monitoring.org/project/20547/, which has the version
>>>   + codename, and seems to be updated
>>>
>>> So it looks like we should use the second one, and therefore keep the
>>> code name ?  
>>
>> The second entry was not originally present. I added it myself because
>> as you say the first one is pretty outdated. I preferred add a new entry
>> rather than edit the existing one because the version scheme changed
>> (this is now using the github repo) and could break one of the multiple
>> disto that already map kodi.
> 
> OK, but then it answers your initial question: for Kodi itself, we
> should use the "17.3-Foo" string as the version.

Alright, there is still the question of all kodi's plugins. While the
majority use the codename suffix, a bunch of them are not. This
situation will probably improve with the next bump as kodi's team seems
more consistent with their release tags since 18.1-Leia.

As those inconsistencies are not related to buildroot but rather to kodi
itself, I suggest to let the situation as it is.

Regards,
Victor

-- 
Victor Huesca, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
