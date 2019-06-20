From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Jun 2019 22:32:29 +0200
Subject: [Buildroot] [PATCH 0/4] Sanetize packages version
In-Reply-To: <a5f09272-46f4-5092-8f4f-12d319b7266c@bootlin.com>
References: <20190612064209.23619-1-victor.huesca@bootlin.com>
 <20190612092624.1ca7836d@windsurf>
 <627e16bb-a937-a00e-7d03-7373c69433ca@bootlin.com>
 <20190612165020.441113ee@windsurf>
 <a5f09272-46f4-5092-8f4f-12d319b7266c@bootlin.com>
Message-ID: <da51251f-4903-fd0c-0e49-7cb0d9f5ea3c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Victor,

 Just to be clear: for these complex cases, it's better to make patches per
individual package

On 19/06/2019 17:35, Victor Huesca wrote:
[snip]
> Here is a list of the different packages I found that does have a
> prefix/suffix in their _VERSION variable, for most of them I'm not sure
> if the prefix/suffix should be consider part of the version, any opinion
> on it?
> 
> - android-tools:        4.2.2+git20130218
> The downloaded version is fetch from launchpad, the RM version
> corresponds to the android version because sources for this tool are not
> distributed alone.

 I wonder why we're using this launchpad version instead of the upstream
version. Maybe the original contributor (a certain Thomas P) remembers that?


> - bandwidthd:           2.0.1-auto-r11
> The downloaded version is not the original bandwithd but a fork that
> uses automake, this fork appends -auto-rXX to the actual version.

 We should keep the suffix then.

 Actually, there's another fork under NethServer that seems a little more
active. It's also used by OpenWrt.

 But the sourceforge repo that hasn't seen activity in 15 years that
release-monitoring refers to is definitely not OK :-)



> - imx-alsa-plugins:     rel_imx_4.9.x_1.0.0_ga
> - imx-mkimage:          rel_imx_4.14.78_1.0.0_ga
> I The 4.9.x seems to be related to freescale but I'm not sure about the
> *_ga suffix.

 The 4.9.x / 4.14.78 is the kernel version; the 1.0.0 is the freescale release
on top of that. Obviously these packages really have nothing to do with the
kernel version, but they distribute everything as a single SDK and the kernel
version is the anchor.


> - luarocks fetched packages: luasql-0.2.2.1-1
> A large amount of lua packages have a -1 suffix. This suffix is not
> present on release-monitoring, so I think we should remove it.
> The thing is: the `luarocks-package` function seems to use the
> <pkg>_VERSION variable.
> Remove suffix for those packages will probably require to modify a bit
> the way luarocks packages are handle.

 Hm, good point... The -1 is the packaging version. Sometimes it needs to be
repackaged and you get a -2. And for some reason, sometimes it's -0.

 I don't see a convenient way to work around this...


> If we achieve to modify these packages, the only packages left would be
> those with a commit id as version.

 Commit ID is no problem.


>>>> Kodi has two different entries in release-monitoring.org:
>>>>
>>>>  https://release-monitoring.org/project/5511/, which has only the
>>>>  version, but seems to be outdated
>>>>
>>>>   https://release-monitoring.org/project/20547/, which has the version
>>>>   + codename, and seems to be updated
>>>>
>>>> So it looks like we should use the second one, and therefore keep the
>>>> code name ?  
>>>
>>> The second entry was not originally present. I added it myself because
>>> as you say the first one is pretty outdated. I preferred add a new entry
>>> rather than edit the existing one because the version scheme changed
>>> (this is now using the github repo) and could break one of the multiple
>>> disto that already map kodi.
>>
>> OK, but then it answers your initial question: for Kodi itself, we
>> should use the "17.3-Foo" string as the version.
> 
> Alright, there is still the question of all kodi's plugins. While the
> majority use the codename suffix, a bunch of them are not. This
> situation will probably improve with the next bump as kodi's team seems
> more consistent with their release tags since 18.1-Leia.
> 
> As those inconsistencies are not related to buildroot but rather to kodi
> itself, I suggest to let the situation as it is.

 Ack.

 Regards,
 Arnout
