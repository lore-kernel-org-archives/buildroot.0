From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 22 Oct 2018 23:49:53 +0100
Subject: [Buildroot] [PATCH] systemd: Allow building with no init system
In-Reply-To: <1540233070.30311.32.camel@impinj.com>
References: <20180917182900.15902-1-tpiepho@impinj.com>
 <9ddf2016-0a94-d873-311a-e1565386801e@mind.be>
 <1540233070.30311.32.camel@impinj.com>
Message-ID: <2b7de4a1-14cb-a057-aec8-655a639252d8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Trent,

On 10/22/18 7:31 PM, Trent Piepho wrote:
> On Sun, 2018-10-21 at 18:28 +0100, Arnout Vandecappelle wrote:
>> On 17/09/2018 19:29, Trent Piepho wrote:
>>> It's possible to build systemd, and use the systemd libraries, on a
>>> target with no init system.
>>>
>>> While installing systemd when trying to use SysV init will result in
>>> systemd clobbering the SysV system and vice versa, it may well work when
>>> no init system has been selected.  For instance, when building an SDK
>>> the sytemd headers and libraries might be necessary but there is no
>>> reason to have an init system selected.  Someone creating a custom init
>>> system might also want some of the systemd libraries.
>>
>>  I understand your reasoning and I tend to agree to some extent.
>>
>>  However, for the use cases you mention, you can actually just enable
>> BR2_INIT_SYSTEMD. If you really don't want /sbin/init in your target, just
>> remove it post-build.
> 
> You get /usr/sbin/init either way.  What I was trying to do was to stop
> building target dbus plus dependencies for an SDK.  But this doesn't
> really do that so it doesn't accomplish all that much on it's own.

 Indeed, also the dependencies that are not really needed should be removed to
be completely correct.

> 
>>  To *properly* support a libsystemd-only configuration, a lot more should
>> change. Basically, nothing should be installed in target except for
>> libsystemd.so (and the header files which will be removed in finalize). Also,
>> there is a possible conflict with eudev that needs to be resolved. Possibly
>> other things would need to be cleaned up as well.
> 
> I figured that either one is creating an SDK, in which case it doesn't
> matter what is in target as long as the stage has the libraries, or one
> is creating a custom hybrid init, in which case they'll have to figure
> out the above and lot of other things too.
> 
> You've got a point about nothing installed on target, that happens to
> apply very much to an SDK.  Why even run the target_install steps when
> building an SDK? Why not skip the build of any target package without a
> INSTALL_STAGING component?

 Well, for starters, the SDK usecase is a fairly recent addition to Buildroot.
It's not our core business to generate an SDK. There is no way for Buildroot to
"know" that you're building an SDK: you just select a bunch of packages and then
run 'make sdk' but that is just doing a 'make all' plus some postprocessing.

 So you could add a Kconfig symbols that says that you're building just an SDK,
and use that to avoid creating a target directory. But that seems like a lot of
effort and complexity for pretty little gain: how much does it hurt you to have
that target directory lying around?

 If we were to go that way, we would really want to rework the way we do staging
and target install. Instead of doing both in parallel, it would be better to
always install to staging, and then copy from staging to target. But that is a
major rework which requires modifying a lot of packages. So it will not happen
any time soon :-)

 Regards,
 Arnout
