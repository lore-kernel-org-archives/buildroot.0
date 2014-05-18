From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 May 2014 19:29:28 +0200
Subject: [Buildroot] [PATCH v8 21/28] xbmc: Add X.org/OpenGL support
In-Reply-To: <le5n4bxjvb.ln2@ID-313208.user.individual.net>
References: <1400342276-10303-1-git-send-email-bernd.kuhls@t-online.de>
 <1400342276-10303-22-git-send-email-bernd.kuhls@t-online.de>
 <20140517205500.GL3459@free.fr>
 <0sjm4bxrs4.ln2@ID-313208.user.individual.net>
 <20140518162900.GA3631@free.fr>
 <le5n4bxjvb.ln2@ID-313208.user.individual.net>
Message-ID: <20140518172928.GD3631@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-05-18 18:58 +0200, Bernd Kuhls spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote in
> news:20140518162900.GA3631 at free.fr: 
> 
> > Something like:
> [...]
> > should do the trick.
> 
> Hi,
> 
> for further comments I posted my current patch here:
> http://pastebin.com/zv7jueLB (expires in one week).
> 
> Especially the last "depends on" block looks crude, but seems to work.

Yep, it looks too dense. I think we can factor it into:

    depends on BR2_arm || BR2_i386 || BR2_x86_64
    depends on HAS_LIBEGL && HAS_LIBGLES \
            || (BR2_i386 || BR2_x86_64) && HAS_LIBGL

So, it first ensures that it is only visible for ARM or x86 (the only
archs we currently support SBMC on.)

Then, it is available only for EGL+GLES or x86+GL, since EGL+GLES is
posible on ARM and x86 alike, but full GL is only possible on x86.

I think it is much cleaner to separate the architectures dependencies
from the GL dependencies.

Of course, this would probably not scale if we were to support it on
other archs (eg. PPC), but it will be time to revisit this if/when we
happen to add that support.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
