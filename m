From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Sep 2012 00:37:47 +0200
Subject: [Buildroot] [PATCH 4/4] Split target/Config.in.arch into
	multiple Config.in.* in arch/
In-Reply-To: <bf030fb668c9608de1f3e99bac17bf300ad59c67.1346767209.git.thomas.petazzoni@free-electrons.com>
References: <cover.1346767209.git.thomas.petazzoni@free-electrons.com>
 <bf030fb668c9608de1f3e99bac17bf300ad59c67.1346767209.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201209050037.48126.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Tuesday 04 September 2012 16:04:09 Thomas Petazzoni wrote:
> target/Config.in.arch had become too long, and we want to remove the
> target/ directory. So let's move it to arch/ and split it this way:

Another comment I forgot:

[--SNIP--]
> +config BR2_ARM_TYPE
> +	string
> +	default GENERIC_ARM	if BR2_generic_arm

Strings in Kconfig should be enclosed between double-quotes:
    default "GENERIC_ARM" if BR2_generic_arm

In fact, consider this situation:

    config GENERIC_ARM
        string "blabla"
        default "generic"

    config BR2_ARM_TYPE
        string
        default GENERIC_ARM

Then 'defconfig' would give:
    GENERIC_ARM="generic"
    BR2_ARM_TYPE="generic"

And setting GENERIC_ARM to 'whatever' would give:
    GENERIC_ARM="whatever"
    BR2_ARM_TYPE="whatever"

The code currently works because there is no such symbol which name is
one of our values. That's luck!

Maybe we could use this patch series to continue the cleanup...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
