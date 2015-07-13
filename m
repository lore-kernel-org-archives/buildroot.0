From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Date: Mon, 13 Jul 2015 11:24:28 +0200
Subject: [Buildroot] [PATCH v2] wpa_supplicant: Add NL80211 support
	option
In-Reply-To: <20150712192552.23e76408@free-electrons.com>
References: <1407514672-6231-1-git-send-email-jtheou@adeneo-embedded.us>
 <20150712192552.23e76408@free-electrons.com>
Message-ID: <55A383CC.8030809@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/07/2015 19:25, Thomas Petazzoni wrote:
> Dear Jean-Baptiste Theou,
> 
> On Fri, 8 Aug 2014 09:17:52 -0700, Jean-Baptiste Theou wrote:
>> When you select wpa_supplicant, having an visual indication about the
>> support or not of NL80211 is important.
>>
>> And even if libnl is available, you may want to disable the support of
>> NL80211 inside wpa_supplicant.
> 
> You forgot your Signed-off-by here. But we anyway have more comments
> below.
> 
>> +config BR2_PACKAGE_WPA_SUPPLICANT_NL80211
>> +	bool "Enable NL80211"
>> +	default y if BR2_PACKAGE_LIBNL
>> +	select BR2_PACKAGE_LIBNL
>> +	help
>> +	  Enable support for NL80211.
> 
> In which cases would you want to *not* have NL80211 support if you
> already have libnl enabled? What is the reason/use-case?

The author made it clear that it is not the main reason.  The main
reason is that wpa_supplicant's usefulness is pretty reduced if
nl80211 is not enabled;

With a default kernel configuration, only nl80211 is supported since
the deprecated wext compatibility is disabled by default, so you may
even end up with a wpa_supplicant binary that can not manage any wifi
device if you forgot about enabling libnl to have nl80211.

And wpa_supplicant is not entirely useless without nl80211 either: you
may want to only use the wired driver to do 802.1x on Ethernet
networks, or you may only need the wext driver because you are using
some old/unmaintained out-of-tree linux driver that only knows about wext.

In either case, it is useful to have an option to enable nl80211, and
I would even suggest it to be enabled by default (and removing the
automatic dependency, of course).  I'm quite sure that some features
which are already optional (such as HS20 or WPS) are useless/dead code
without nl80211.
