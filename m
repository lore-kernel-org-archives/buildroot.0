From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 13 Dec 2018 15:51:10 +0000
Subject: [Buildroot] =?utf-8?q?=5BBug_11556=5D_Can_not_build_qt5base_5=2E?=
 =?utf-8?q?11=2E2_with_weston_3=2E0=2E0_and_vivante_GPU=2E_error=3A_invali?=
 =?utf-8?b?ZCBjb252ZXJzaW9uIGZyb20g4oCYdm9pZCrigJkgdG8g4oCYRUdMTmF0aXZl?=
 =?utf-8?q?DisplayType_=7Baka_wl=5Fdisplay*=7D=E2=80=99_=5B-fpermissive=5D?=
In-Reply-To: <bug-11556-163@https.bugs.busybox.net/>
References: <bug-11556-163@https.bugs.busybox.net/>
Message-ID: <bug-11556-163-FVnYmpeRcz@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11556

--- Comment #4 from Patrick Koller <koller@stettbacher.ch> ---
The previously mentioned error could be solved by casting the pointers
manually. Thanks to @Peter.
**************************************************
Nevertheless, I am facing this new error:

qwaylanddisplay.cpp: In member function ?void
QtWaylandClient::QWaylandDisplay::addRegistryListener(QtWaylandClient::RegistryListener,
void*)?:
qwaylanddisplay.cpp:315:35: error: could not convert ?{listener, data}? from
?<brace-enclosed initializer list>? to
?QtWaylandClient::QWaylandDisplay::Listener?
     Listener l = { listener, data };
                                   ^
Makefile:1435: recipe for target '.obj/qwaylanddisplay.o' failed
make[3]: *** [.obj/qwaylanddisplay.o] Error 1
make[3]: Leaving directory
'/home/patrickk/tmp/buildroot/a/output/build/qt5wayland-5.11.2/src/client'
Makefile:73: recipe for target 'sub-client-make_first' failed
make[2]: *** [sub-client-make_first] Error 2
make[2]: *** Waiting for unfinished jobs....
extensions/qwaylandxdgshellv6.cpp: In member function ?uint
QWaylandXdgToplevelV6::sendConfigure(const QSize&, const
QVector<QWaylandXdgToplevelV6::State>&)?:
extensions/qwaylandxdgshellv6.cpp:957:100: error: no matching function for call
to
?QWaylandXdgToplevelV6Private::ConfigureEvent::ConfigureEvent(<brace-enclosed
initializer list>)?
    
d->m_pendingConfigures.append(QWaylandXdgToplevelV6Private::ConfigureEvent{states,
size, serial});
                                                                               
                    ^
extensions/qwaylandxdgshellv6.cpp:957:100: note: candidates are:
In file included from extensions/qwaylandxdgshellv6.cpp:38:0:
extensions/qwaylandxdgshellv6_p.h:137:12: note:
QWaylandXdgToplevelV6Private::ConfigureEvent::ConfigureEvent()
     struct ConfigureEvent {
            ^
extensions/qwaylandxdgshellv6_p.h:137:12: note:   candidate expects 0
arguments, 3 provided
extensions/qwaylandxdgshellv6_p.h:137:12: note:
QWaylandXdgToplevelV6Private::ConfigureEvent::ConfigureEvent(const
QWaylandXdgToplevelV6Private::ConfigureEvent&)
extensions/qwaylandxdgshellv6_p.h:137:12: note:   candidate expects 1 argument,
3 provided
extensions/qwaylandxdgshellv6_p.h:137:12: note:
QWaylandXdgToplevelV6Private::ConfigureEvent::ConfigureEvent(QWaylandXdgToplevelV6Private::ConfigureEvent&&)
extensions/qwaylandxdgshellv6_p.h:137:12: note:   candidate expects 1 argument,
3 provided
Makefile:3517: recipe for target '.obj/qwaylandxdgshellv6.o' failed
make[3]: *** [.obj/qwaylandxdgshellv6.o] Error 1
make[3]: Leaving directory
'/home/patrickk/tmp/buildroot/a/output/build/qt5wayland-5.11.2/src/compositor'
Makefile:98: recipe for target 'sub-compositor-make_first' failed
make[2]: *** [sub-compositor-make_first] Error 2
make[2]: Leaving directory
'/home/patrickk/tmp/buildroot/a/output/build/qt5wayland-5.11.2/src'
Makefile:46: recipe for target 'sub-src-make_first' failed
make[1]: *** [sub-src-make_first] Error 2
make[1]: Leaving directory
'/home/patrickk/tmp/buildroot/a/output/build/qt5wayland-5.11.2'
package/pkg-generic.mk:229: recipe for target
'/home/patrickk/tmp/buildroot/a/output/build/qt5wayland-5.11.2/.stamp_built'
failed
make: ***
[/home/patrickk/tmp/buildroot/a/output/build/qt5wayland-5.11.2/.stamp_built]
Error 2
**************************************************
I will investigate further and report my progress here.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
