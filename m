From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 11 Sep 2016 22:52:44 +0200
Subject: [Buildroot] [PATCH 0/4] Fix a few unmet dependencies (branch
 yem/unmet-deps)
In-Reply-To: <20160911135412.GM5740@free.fr>
References: <cover.1473597259.git.yann.morin.1998@free.fr>
 <20160911154921.32548505@free-electrons.com> <20160911135412.GM5740@free.fr>
Message-ID: <26d0e9fe-1bbd-2e50-f703-8bdfb7b8aa62@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-09-16 15:54, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2016-09-11 15:49 +0200, Thomas Petazzoni spake thusly:
>> On Sun, 11 Sep 2016 14:38:52 +0200, Yann E. MORIN wrote:
>>> However, there is one such unmet direct dependency I was not able to
>>> understand (with this series already applied):
>>>
>>>     $ make KCONFIG_SEED=0x9F309288 randconfig
>>>     warning: (BR2_PACKAGE_OPENCV_WITH_GSTREAMER && BR2_PACKAGE_OPENCV3_WITH_GSTREAMER)
>>>     selects BR2_PACKAGE_GST_PLUGINS_BASE which has unmet direct dependencies
>>>     (BR2_PACKAGE_GSTREAMER)
>>>     warning: (BR2_PACKAGE_FREERDP_GSTREAMER && BR2_PACKAGE_QT_WEBKIT &&
>>>     BR2_PACKAGE_OPENCV_WITH_GSTREAMER && BR2_PACKAGE_OPENCV3_WITH_GSTREAMER) selects
>>>     BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP which has unmet direct dependencies
>>>     (BR2_PACKAGE_GSTREAMER && BR2_PACKAGE_GST_PLUGINS_BASE)
>>>
>>> As far as I can see, the dependencies of gstreamer and gst-plugins-base
>>> *are* properly propagated to the offending packages. I think I'm gonna
>>> loose my sanity on that one... :-/ If any one feels adventurous...
>>
>> Do you have some sample .config that exhibits those problems?
> 
> As explained above, just run:
> 
>     make KCONFIG_SEED=0x9F309288 randconfig
> 
> But it may no longer work, since the set of options has changed now. You
> can reproduce it with:
> 
>     $ git checkout f4918b3a
>     $ make KCONFIG_SEED=0x9F309288 randconfig
> 
> (f4918b3a is master before you applied the last few patches changing the
> set of options).
> 
>> I had a
>> quick look, and it indeed seems weird. opencv is select both gstreamer
>> and gst-plugins-base, so I don't see why the dependency of
>> gst-plugins-base on gstreamer is a problem.
> 
> Neither do I.
> 
> And if you run "make olddefconfig" there is no error anymore... :-/

 I guess it must be a weird side-effect of the randconfig. The
BR2_PACKAGE_OPENCV_WITH_GSTREAMER && BR2_PACKAGE_OPENCV3_WITH_GSTREAMER
bit is very wrong (opencv3 depends on !opencv).

 Regards,
 Arnout

> 
> Regards,
> Yann E. MORIN.
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
