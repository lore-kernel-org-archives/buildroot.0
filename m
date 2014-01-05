From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Jan 2014 18:41:15 +0100
Subject: [Buildroot] [PATCH 1/1 v2] Hide issue and hostname menu when
 using a custom skeleton.
In-Reply-To: <1358102400-9628-1-git-send-email-sagaert.johan@skynet.be>
References: <1358102400-9628-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <20140105174115.GE16066@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sagaert, All,

On 2013-01-13 19:39 +0100, Sagaert Johan spake thusly:
> Only show hostname and issue options when the default skeleton is selected.
> Moved the menu sections so that when a custom skeleton is selected the 
> issue and hostname options are hidden.

After fiddling with the idea, I believe we should not do it that way.

It can well happen that a custom skeleton does not already have an
hostname or issue file, and we may want to create either or both in this
case.

So I think we should do it differently:

    config BR2_TARGET_GENERIC_HOSTNAME
        string "System hostname"
        default "buildroot" if BR2_ROOTFS_SKELETON_DEFAULT
        default ""          if ! BR2_ROOTFS_SKELETON_DEFAULT
        help
          Select system hostname to be stored in /etc/hostname.
          Leave empty to not create /etc/hostname, or to keep the
          one from a custom skeleton.

And system/system.mk already ensures we do not create /etc/hostname if
BR2_TARGET_GENERIC_HOSTNAME is empty.

That way, the default is correct in both cases, and it is still possible
to create/override hostname and issue for a custom skeleton.

(Ditto for /etc/issue).

Thoughts?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
