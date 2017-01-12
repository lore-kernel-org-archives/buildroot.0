From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Thu, 12 Jan 2017 14:12:02 -0800
Subject: [Buildroot] [RFC] external toolchain scanner
In-Reply-To: <20170112173223.GA3716@free.fr>
References: <303be768-557b-3b02-c4fd-ae11ec2858ec@mentor.com>
 <8037285d-a8b2-39c9-30c4-cba364583ae9@mentor.com>
 <20161208210228.GA27341@free.fr>
 <df15f689-fb98-5710-6c90-2ee0e5efb0be@mentor.com>
 <c542e7c5-39e9-5d1f-1611-63ad49d26371@mentor.com>
 <20170112173223.GA3716@free.fr>
Message-ID: <ef0f8d40-903d-1859-aa45-d99b8fe49887@mentor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/12/2017 09:32 AM, Yann E. MORIN wrote:
> Hollis, All,
>
> On 2017-01-09 15:07 -0800, Hollis Blanchard spake thusly:
>> On 12/19/2016 12:07 PM, Hollis Blanchard wrote:
>>    2. What options exactly determine the CFLAGS? If not a lot of processing is involved, those options could also be fed into the
>>    scanner for it to calculate CFLAGS independently, i.e.
>>      * .config -> scanner -> combined.config
>>      * combined.config -> make -> output/*
> Well, the whole point of the scanner is to come up with an initial
> .config pre-filled with the toolchain settings.
>
> Going to the menuconfig then back to the shell to run the scanner, then
> back to the menuconfig is not user-friendly... :-/

In my case, the user is already provided with a .config, which is why I 
mention it above. However, in the case where there is no .config nor 
board/*/defconfig, no initial .config is necessary.

In other words, your scenario becomes:

  * scanner -> .config
  * .config -> make menuconfig -> .config
  * .config -> make -> output/*

>>    3.2. Perhaps the user could be required to input both the architecture and sysroot. That would be an optional prompt if multiple
>>    sysroots are preset. Just like with the multiarch prompting that's done today, it could look like this:
> Or the scanner could just bail out, instructing the user to go to the
> menuconfig and fill the values all by himself. Which defeats the very
> purpose of the toolchain in the first place.
>
> We don't want a scanner if all it is able to do is just fill the obvious
> values. The scanner only becomes interesting if it can do the job in the
> most complex cases (IMHO).
On this point, I strongly believe the opposite. The whole reason I did 
this in the first place is because there are values that Buildroot 
/doesn't/ fill in which are easily-calculable, but not obvious to the 
end-user. Buildroot actually already knows the answers, but makes the 
user try to figure them out anyways, then complains if the user gets it 
wrong. That's... "not desirable," to put it politely. :-)

If there's some reason that Buildroot /can't/ calculate the answers, 
then by all means the scanner should abort too (or simply decline to 
emit the settings).
> However, what we could do is spit-out all the incorrect settings on
> first run, rather than stop on the first problem. That way, the user
> would have a single run to check the settings and fix them, rather than
> the current behaviour of going back to the menuconfig for each and every
> incorrect setting...
>
> I would rather that we work toward this goal, which would be a
> termendous improvement on what we currently have.
I agree that emitting 5 errors at once, rather than emitting 1 error a 
time for 5 iterations, is an improvement on a disagreeable situation. I 
bet you can guess what I'll say next, though: when you look at the 
bigger picture, we shouldn't be in this situation to begin with. :-) 
When we already know the answers, we should tell the user, not the other 
way around.

Hollis Blanchard <hollis_blanchard@mentor.com>
Mentor Graphics Emulation Division

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170112/ed6b4316/attachment.html>
