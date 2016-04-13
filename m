From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Apr 2016 09:38:28 +0200
Subject: [Buildroot] [PATCH 4/4] board/minnowboard-max: Add a X-based
 graphical defconfig
In-Reply-To: <CAAEAJfACmsVV4vM3Rx_EaJrWvZV-KmmjhY+t6SmtE3JwDpYkcA@mail.gmail.com>
References: <1460438965-28065-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1460438965-28065-5-git-send-email-ezequiel@vanguardiasur.com.ar>
 <570D87A6.3030907@mind.be>
 <CAAEAJfACmsVV4vM3Rx_EaJrWvZV-KmmjhY+t6SmtE3JwDpYkcA@mail.gmail.com>
Message-ID: <570DF774.8060105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/13/16 02:02, Ezequiel Garcia wrote:
> On 12 April 2016 at 20:41, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 04/12/16 07:29, Ezequiel Garcia wrote:
[snip]
>>> +
>>> +# Setup xinitrc
>>> +echo "exec /usr/bin/openbox-session" > ${TARGET_DIR}/root/.xinitrc
>>
>>
>>   Put this in the fs-overlay.
>>
>>> +
>>> +# Fixup startx so it doesn't start X on the controlling
>>> +# virtual console. Apparently, this is a bug and we are
>>> +# affected for our lack of a Display Manager.
>>> +# See https://bugs.freedesktop.org/show_bug.cgi?id=87762
>>> +#
>>> +# I haven't found a way to do this without hacking startx
>>> +# itself, so...
>>
>>
>>   This comment should be in the startx script itself.
>>
>>> +cp board/minnowboard-max/startx ${TARGET_DIR}/usr/bin/startx
>>> +
>>> +# Customize ALSA: the HDMI PCM is at card=0, device=3 (i.e. hw:0,3)
>>
>>
>>   Same here.
>>
>
> OK, I'll add a fs-graphical-overlay dir, and use it in this defconfig.

  Call it fs-overlay-graphical.

[snip]
>>> +BR2_PACKAGE_GREP=y
>>
>>
>>   Not sure why we would want this. Doesn't it require BUSYBOX_SHOW_OTHERS?
>>
>
> I think some X or openbox script was using a feature from GNU grep,
> and I wanted to remove some minor error/warning.

  In that case, the package involved should probably select GNU grep (and 
SHOW_OTHERS).

[snip]
>>> +BR2_PACKAGE_COREUTILS=y
>>
>>   Why?
>>
>>> +BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS=y
>>
>>   Why?
>>
>>> +BR2_PACKAGE_UTIL_LINUX_MORE=y
>>
>>   Why?
>>
>>> +BR2_PACKAGE_LESS=y
>>
>>
>>
>>   I'd like to reorder the packages to put all the X stuff together with a
>> comment above and, and then all the dev stuff (like bash and less) with a
>> comment.
>>
>
> Sure.
>
> Regarding the less, more, coreutils, etc... I routinely replace these
> because I found them more useful than busybox's.

  I agree for less (and bash and vi BTW), but I never found any use for more 
(but I actually never use more, less is better) and coreutils.

>
> I'll remove them, as they don't add anything of value if the goal is
> to provide a "minimal with audio, and 3D graphics" config.

  Than bash should probably be removed as well, except if there is some script 
that depends on bash.

  Regards,
  Arnout

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
