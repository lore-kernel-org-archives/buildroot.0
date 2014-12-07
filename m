From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Dec 2014 11:47:37 +0100
Subject: [Buildroot] [PATCH 4/4] pkg-download: check hasahes for locally
 cached files
In-Reply-To: <20141206135309.016c7151@free-electrons.com>
References: <cover.1417475935.git.yann.morin.1998@free.fr>
 <e1cc728a60b6a250ea395ee429dba7f470b1f8a8.1417475935.git.yann.morin.1998@free.fr>
 <20141202093148.1a1f7db7@free-electrons.com>
 <20141203185157.GG4152@free.fr> <20141206124441.GC9544@free.fr>
 <20141206135309.016c7151@free-electrons.com>
Message-ID: <20141207104737.GA3794@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-12-06 13:53 +0100, Thomas Petazzoni spake thusly:
[--SNIP--]
> define DOWNLOAD_WGET
>         test -e $(DL_DIR)/$(2) || \
>         $(EXTRA_ENV) support/download/wrapper wget \
>                 $(DL_DIR)/$(2) \
>                 '$(call qstrip,$(1))' && \
>         $(call VERIFY_HASH,$(PKGDIR)/$($(PKG)_NAME).hash,$(DL_DIR)/$(2))
> endef
> 
> 
> Hum, the construct 
> 
> 	test -e <foo> || download && check-hash

Well, in shell, the || and && operators have the same priority. In fact,
POSIX does not state that there should be any priority or that there
should be one. The phrasing in POSIX is very ambiguous:

    AND Lists

    The control operator "&&" denotes an AND list. The format shall be:

        command1 [ && command2] ...

    First command1 shall be executed. If its exit status is zero, command2
    shall be executed, and so on, until a command has a non-zero exit status
    or there are no more commands left to execute. The commands are expanded
    only if they are executed.

    Exit Status

    The exit status of an AND list shall be the exit status of the last
    command that is executed in the list.

    OR Lists

    The control operator "||" denotes an OR List. The format shall be:

        command1 [ || command2] ...

    First, command1 shall be executed. If its exit status is non-zero,
    command2 shall be executed, and so on, until a command has a zero exit
    status or there are no more commands left to execute.

    Exit Status

    The exit status of an OR list shall be the exit status of the last
    command that is executed in the list.

So, if one wants priority to be allied, one should use a compund
command, either {compound-list;} or (compound-list).

Yes, this sucks.

The advantage of moving that to the download wrapper makes the Makefile
code shrink considerably and makes it easier to read, since we get rid
of these AND-OR lists, we are non-trivial to read.

(Note: I too was very surprised that || and && do not have a priority,
and was bitten by it more often than not in the past; still today I do
this mistake quite often.)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
