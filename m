From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Jul 2015 10:54:07 +0200
Subject: [Buildroot] [PATCHv3 for next 2/2] toolchain: create symlink to
 'lib' from ARCH_LIB_DIR iso fixed lib32/lib64
In-Reply-To: <CAAXf6LX_draMhkTRq5zdykPO1pRy6wu4tB744cJrUf7agO45_A@mail.gmail.com>
References: <1424259375-20288-1-git-send-email-patrickdepinguin@gmail.com>
 <1424259375-20288-3-git-send-email-patrickdepinguin@gmail.com>
 <55A3EDEA.7040308@mind.be>
 <CAAXf6LX_draMhkTRq5zdykPO1pRy6wu4tB744cJrUf7agO45_A@mail.gmail.com>
Message-ID: <55A4CE2F.60308@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/14/15 10:09, Thomas De Schampheleire wrote:
> On Mon, Jul 13, 2015 at 6:57 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>  Hi Thomas,
>>
>>  Sorry that it is taking so long to make progress on this, but the external
>> toolchain stuff is, as you know, horribly demotivating... We've spent quite a
>> bit of time to understand what this patch does and how it could be done better...
>>
>> On 02/18/15 12:36, Thomas De Schampheleire wrote:
[snip]
>>> - to fix build order problems, add the correct dependency on
>>>   $(BUILD_DIR) from $(BUILD_DIR)/.root
>>
>>  It's not clear to us which build order problems are solved by this, and
>> especially how these build order problems are introduced by this patch... Could
>> you explain that a little?
[snip]
> It is caused by the fact that the patch adds a dependency on
> $(TARGET_DIR) to host-gcc-final via create-lib-symlinks, and
> $(TARGET_DIR) has a dependency on $(BUILD_DIR)/.root (see Makefile).
> 
> If the host-gcc-final change is fixed in another way (I have to check)
> this may not be needed after all. However, technically I think the
> expression of the dependency is correct: $(BUILD_DIR)/.root indeed
> needs BUILD_DIR first. Alternatively you could add a dependency on
> 'dirs' somewhere.

 Or add an mkdir -p $(BUILD_DIR) in the commands of $(BUILD_DIR)/.root itself.
I'm personally a bit opposed against having directories as dependencies,
precisely because of the need for order-only dependencies that you also discovered.

 And I think that could be a separate patch - it may be a problem for top-level
parallel build as well, and it can be merged quickly.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
