From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 01 Jul 2008 21:22:05 +0200
Subject: [Buildroot] Ncurses install problem
In-Reply-To: <C48FE36B.18B7D%bkubesh@cisco.com> (Blaine Kubesh's message of
	"Tue\, 01 Jul 2008 13\:36\:43 -0500")
References: <C48FE36B.18B7D%bkubesh@cisco.com>
Message-ID: <873amtwgte.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Blaine" == Blaine Kubesh <bkubesh@cisco.com> writes:

 Blaine> I ran into the same thing. Here is my post from 6/2/08.

 Blaine> There is a typo/bug on the commit from 3/31/08. It should be
 Blaine> soft linking into the TARGET_DIR and not the host filesystem.

 Blaine> -    ln -sf /usr/share/terminfo $(TARGET_DIR)/usr/lib/terminfo
 Blaine> +    ln -sf $(TARGET_DIR)/usr/share/terminfo $(TARGET_DIR)/usr/lib/terminfo

No that won't fly - as you won't have TARGET_DIR on the target
system. You could maybe argue for a relative link (../share/terminfo).

The problem is that ln will follow the $TARGET_DIR/usr/lib/terminfo
symlink if it already exists and try to create
$TARGET_DIR/usr/lib/terminfo/terminfo (which is
/usr/share/terminfo/terminfo) - That ofcause isn't allowed. The
solution is to use the -n option.

-- 
Bye, Peter Korsgaard
