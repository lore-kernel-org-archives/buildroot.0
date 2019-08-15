From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 15 Aug 2019 19:50:09 +0000
Subject: [Buildroot] [Bug 11781] mariadb build error
In-Reply-To: <bug-11781-163@https.bugs.busybox.net/>
References: <bug-11781-163@https.bugs.busybox.net/>
Message-ID: <bug-11781-163-73fbEK5iQC@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11781

--- Comment #4 from Peter Seiderer <ps.report@gmx.net> ---
Can reproduce the failure Arnout describes (on buildroot master), fixed by:

diff -u build/mariadb-10.3.16/cmake/os/Linux.cmake.orig
build/mariadb-10.3.16/cmake/os/Linux.cmake
--- build/mariadb-10.3.16/cmake/os/Linux.cmake.orig     2019-08-15
21:36:25.032673425 +0200
+++ build/mariadb-10.3.16/cmake/os/Linux.cmake  2019-08-15 21:36:54.065106056
+0200
@@ -27,8 +27,8 @@
 # Fix CMake (< 2.8) flags. -rdynamic exports too many symbols.
 FOREACH(LANG C CXX)
   STRING(REPLACE "-rdynamic" "" 
-  CMAKE_SHARED_LIBRARY_LINK_${LANG}_FLAGS
-  ${CMAKE_SHARED_LIBRARY_LINK_${LANG}_FLAGS}  
+  "CMAKE_SHARED_LIBRARY_LINK_${LANG}_FLAGS"
+  "${CMAKE_SHARED_LIBRARY_LINK_${LANG}_FLAGS}"
   )
 ENDFOREACH()

Disclaimer: no cmake expert, just a quick fix/hack, not sure if the patch makes
sense ;-), but fixes the configure error...

@Alexey: Your failure is with buildroot-2018.11.4, feel free to try the patch,
in case of failure please provide a complete config/defconfig file to reproduce
and a complete log of the mariadb build steps (your provided log is only about
the cmake checks, no real failure)...

-- 
You are receiving this mail because:
You are on the CC list for the bug.
