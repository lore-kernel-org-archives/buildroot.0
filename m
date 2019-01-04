From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 4 Jan 2019 20:51:04 +0100
Subject: [Buildroot] [PATCH] systemd: set vconsole support option to
 default y
In-Reply-To: <8e4371b94ff9458b901d240de1c97cce@exitstrategytech.com>
References: <8e4371b94ff9458b901d240de1c97cce@exitstrategytech.com>
Message-ID: <20190104195104.GE19623@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

David,All,

On 2019-01-04 18:16 +0000, David J. Fogle spake thusly:
> This patch defaults the systemd vconsole support option to y. The reasoning is a matter of convention, Linux systems have vconsoles in almost all cases. Personally, I spent a few hours feeling I had broken something when I was switching to systemd. In an effort to prevent future buildroot users from suffering this fate, we are enabling this support by default, as it is far less likely to *not* want vterms, and if that is the use-case, it can be disabled as needed. 

So, it is too bad that your previous attempts did not hit the mailing
list, becasue they were properly formatted, while this one is a single
ultra long ling... :-(  Let me wrap it below for clarity, and ease of
review:

> This patch defaults the systemd vconsole support option to y. The
> reasoning is a matter of convention, Linux systems have vconsoles in
> almost all cases. Personally, I spent a few hours feeling I had broken
> something when I was switching to systemd. In an effort to prevent
> future buildroot users from suffering this fate, we are enabling this
> support by default, as it is far less likely to *not* want vterms, and
> if that is the use-case, it can be disabled as needed.

So, all the needed info is there, but I have a few comments to do about
it nonetheless:

  - the title should start with 'package/systemd' (unwritten convention,
    you could not know);

  - start by describing the actual problem;

  - then explain why it happens (that may be mixed in the explanations,
    above);

  - and finally, explain how it is solved;

  - avoid personal messages like "I did", "I find..." etc.. Instead,
    prefer the neutral first-person plural 'we'.

So, that wouldprobably give something along the lines of:

    package/systemd: set vconsole support option to default y

    Without support for vconsole, systemd will abruptly kill anything
    spawned on the console, thus preventing users from loging in from
    the console, effectively locking them out if the target does not
    have another mean of logging in (no sshd, no serial line...)

    We fix that by making support for vconsole default to y, since
    logging in from the console if more frequent than not. Users can
    still de-activate it when they know they don't need it.

    Note that logging from a serial line is not impacted, and still
    works whether vconsole is enabled or not.

    Signed-off-by: You.

Please, fool-proof this, I may have written a completely bogus blurb,
epsecially the part of the serial line in the last paragraph.

> Signed-off-by: David Fogle <david.j.fogle@gmail.com>
> ---
> ?package/systemd/Config.in | 1 +
> ?1 file changed, 1 insertion(+)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 25f322e8f3..920b65db44 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -325,6 +325,7 @@ config BR2_PACKAGE_SYSTEMD_TMPFILES
> ?
> ?config BR2_PACKAGE_SYSTEMD_VCONSOLE
> ??????? bool "enable vconsole tool"
> +?????? default y

So, that was that simple to enable logging from tty1? Damn... ;-)

With the commit log amended:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ??????? help
> ????????? systemd-vconsole-setup is an early boot service that
> ????????? configures the virtual console font and console keymap.
> -- 
> 2.19.2

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
