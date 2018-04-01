From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Apr 2018 00:08:26 +0200
Subject: [Buildroot] [PATCH 1/1] ncmpc: fix build with ncursesw
In-Reply-To: <20180401175651.2010-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 1 Apr 2018 19:56:51 +0200")
References: <20180401175651.2010-1-fontaine.fabrice@gmail.com>
Message-ID: <87370epokl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Set curses to ncurses as ncurses and ncursesw are the same package in
 > buildroot. Otherwise, build will fail when trying to find
 > ncursesw/curses.h or ncursesw.h.

Thanks. I don't find this commit message very clear, so I've rewritten
it to this and committed:

When ncurses is built with wide support, we install libncursesw (plus a
libncurses symlink) but NOT ncursesw.h, only ncurses.h.  This combination
confuses the ncmpc build system as it expects a ncursesw.h when it finds
libncursesw:

meson.build:92:4: ERROR: Problem encountered: No ncursesw header found

The ncurses/ncursesw logic in the build system is only used to know what
header file to #include, and what library to link with.  As we already
provide a libncurses symlink when building with wide support we can simply
force ncmpc to use the ncurses variant.

-- 
Bye, Peter Korsgaard
