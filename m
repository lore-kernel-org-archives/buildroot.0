From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 22 Aug 2007 23:17:35 +0200
Subject: [Buildroot] Hiding non-buildable packages
In-Reply-To: <1187816364.4321.63.camel@86-115-11-28>
References: <1187728137.6145.48.camel@86-115-11-152>
	<200708222244.38319.yann.morin.1998@anciens.enib.fr>
	<1187816364.4321.63.camel@86-115-11-28>
Message-ID: <200708222317.35411.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 22 August 2007 22:59, Ulf Samuelsson wrote:
> Granted, but do we need it to be perfect?, I think not!
> I know that openssh does not work due to lack of 64 bit math.
> I do not think it works for any architecture.
> Why should every newbie try this out for themseleves,
> only to find that it does not build...
> Much better to hide it from the build, and then let the guy
> which really wants it to reenable and debug it.

The problem with your suggestion, if I may, is that it becomes quite complex
to maintain.

I'd rather have something much simpler, should we do want to add such options:

config MAYBE_BROKEN
    bool
    prompt "Show packages that might not build"
    default y
    help
      Show packages that, for a reason or another, might not build
      for some architecture(s).
      If you're lucky, it will build for yours. If not, you can try to
      fix it, and post your fix. :-)

config REALLY_BROKEN
    bool
    prompt "Show packages that won't build"
    default n
    help
      Some packages are so deeply broken that your help would be
      greatly appreciated should you post a patch solving the issue! :-)
      Warning: this option is not for the faint-hearted!

...

config BR2_PACKAGE_FOO
    bool
    prompt "foo (MAYBE BROKEN)"
    depends on MAYBE_BROKEN
    default n

config BR2_PACKAGE_BAR
    bool
    prompt "bar (BROKEN)"
    depends on REALLY_BROKEN
    default n


Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< ?_? >==-- ?------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
?------------------------------?-------?------------------?--------------------?
