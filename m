From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 Oct 2009 23:05:56 +0200
Subject: [Buildroot] dbus-binding-tool
In-Reply-To: <1254861734.11487.8.camel@bender> (Sven Neumann's message of
	"Tue\, 06 Oct 2009 22\:42\:14 +0200")
References: <1254861734.11487.8.camel@bender>
Message-ID: <87k4z81bd7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> Hi,
 Sven> we are using the dbus-binding-tool from host-dbus-glib in one of our
 Sven> packages and today I found that the dbus-binding-tool binary calls
 Sven> 'glib-genmarshal'. So unless dbus-binding-tool is called with the PATH
 Sven> adjusted to include host_dir/usr/bin before the system path, it will
 Sven> fail in case that no glib-genmarshal is available on the host system.

 Sven> I wonder how this should best be handled. For now I have adjusted our
 Sven> build to call make with the PATH environment variable adjusted similar
 Sven> to how Makefile.autotools.in does it. Should this be the recommended way
 Sven> to call make or should we rather patch dbus-binding-tool in the
 Sven> host-dbus-glib compile to explicitly call glib-genmarshal from
 Sven> host_dir ?

From a quick look at the dbus-glib code, it seems to be a mistake that
they are explicitly calling glib-genmarshal, as the configure script
already gets the correct filename from pkg-config.

Maybe the cleanest solution would be to patch dbus-binding-tool to use
GLIB_GENMARSHAL, and then ensure that the host version of glib-2.0.pc
contains the full path to glib-genmarshal (or let configure add
$prefix/bin in front)? Upstream might even be willing to accept such a
patch.

Otherwise, simply changing DBUS_GLIB_HOST_BINARY to be
PATH=.. dbus-binding-tool or making a shellscript wrapper which sets the
path might be the easiest solution.

-- 
Bye, Peter Korsgaard
