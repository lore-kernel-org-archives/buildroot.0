From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 27 Mar 2019 21:35:51 +0100
Subject: [Buildroot] [PATCH 3/3] package/s6-rc: Allow to integrate s6-rc
 services
In-Reply-To: <20190327195409.14931f34@windsurf>
References: <20190216212835.25503-1-vadim4j@gmail.com>
 <20190216212835.25503-4-vadim4j@gmail.com> <20190327195409.14931f34@windsurf>
Message-ID: <7bb98b03-837a-2494-3de0-b8267a8b7d56@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27/03/2019 19:54, Thomas Petazzoni wrote:
>> +define S6_RC_FINALIZE_INIT_RC
>> +	rm -rf $(TARGET_DIR)/etc/s6/rc/compiled-initial
>> +	$(HOST_DIR)/bin/s6-rc-compile -v 1 \
>> +		$(TARGET_DIR)/etc/s6/rc/compiled-initial \
>> +		$(TARGET_DIR)/etc/s6/rc/service
>> +endef
>> +S6_RC_ROOTFS_PRE_CMD_HOOKS += S6_RC_FINALIZE_INIT_RC
> Meh, I really don't like that this gets executed as a "rootfs pre
> command" hook, but I understand the reasoning behind doing this after
> rootfs overlay / post-build scripts have been handled. Do we need to
> add another sort of hook at the end of the target-finalize target ?
> Should we move the place where TARGET_FINALIZE_HOOKS are executed ? I'm
> not sure.

 At the moment, we have the same problem for Python: the pyc files are generated
in a finalize-hook, so any .py file from the overlay doesn't get compiled.

 On the other hand, a post-build script might want to make changes to something
that was done by Buildroot... Although without a concrete example I don't think
we need to try supporting such a use case.

 So, I've taken a quick look at all the finalize hooks we have, and there's
nothing that jumps out as "this you really want to do before the
overlay/post-build". I'm not sure though how it would interfere with the other
(non-hook) finalizations we're doing (i.e. removing static libs etc.). Every
hook would need to be reviewed in detail to be sure it's OK.

 If such a review is done, I wouldn't mind moving the hooks after the
overlay/post-build. I've checked the history, and I think the order of things is
mostly accidental. When post-build script was introduced (commit eed7d8737ad) it
was put at the end of target-finalize, without specific explanation. However, at
that time, purgelocales was still done after target-finalize (now it has moved
to a TARGET_FINALIZE_HOOK so it's done in the beginning). So I think there was
no real consideration at the time. When the overlay was added, it was put just
before the post-build script, which makes sense. And around that time,
everything had moved before the post-build script, so when the
TARGET_FINALIZE_HOOKS were introduced it made sense to keep that before the
post-build script as well.

 We do have to take into account, however, that this may break existing
overlays/post-build scripts in surprising ways... So it should definitely be
mentioned in the release notes!

 Regards,
 Arnout
