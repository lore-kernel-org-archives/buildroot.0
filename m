From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 3 Jan 2019 14:17:51 -0800
Subject: [Buildroot] Xtensa toolchain issue ?
In-Reply-To: <20190102112130.0b8d32f8@windsurf>
References: <20190102112130.0b8d32f8@windsurf>
Message-ID: <CAMo8BfJR7vgLDONmKDX3S8RLyJBMYmXEKjjEr3JK5JOTHrd5hg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Jan 2, 2019 at 2:21 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> We have a build failure of the libtorrent-rasterbar package that seems
> to be toolchain related, and happens on Xtensa:
>
>   http://autobuild.buildroot.net/?reason=libtorrent-rasterbar-1.1.11
>
> The failure looks like this:
>
> In file included from peer_connection.cpp:56:0:
> ../include/libtorrent/peer_connection.hpp:550:8: error: generic thunk code fails for method 'virtual void libtorrent::peer_connection::_ZThn96_NK10libtorrent15peer_connection8peer_logENS_14peer_log_alert11direction_tEPKcS4_z(libtorrent::peer_log_alert::direction_t, const char*, const char*, ...) const' which uses '...'
> It is apparently a bug in gcc 7.x, that has been fixed in gcc 8.x,
> according to https://bugzilla.redhat.com/show_bug.cgi?id=1511021, but
> this bug report doesn't give any detail on which commit could have
> fixed that.

My understanding is that this is not something that could be fixed
in a generic way, but requires support from the compiler backend.
Specifically it needs a way to tail-call a variadic function from a
thunk, something that is not trivial to do on xtensa architecture.
The corresponding test in the gcc test suite
(gcc/testsuite/g++.old-deja/g++.jason/thunk3.C)
has been disabled since 2002.

The test in the bug that you've referenced still fails on xtensa with
gcc 8 and gcc 9.

I'll try to implement required support in the xtensa backend for the
above to work.
--
Thanks.
-- Max
