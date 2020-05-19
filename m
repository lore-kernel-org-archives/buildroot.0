From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 19 May 2020 21:26:53 +0000
Subject: [Buildroot] [Bug 12391] CMake-based host package fails to include
 output/host/include
In-Reply-To: <bug-12391-163@https.bugs.busybox.net/>
References: <bug-12391-163@https.bugs.busybox.net/>
Message-ID: <bug-12391-163-dBDrxC8sim@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12391

Thomas Petazzoni <thomas.petazzoni@bootlin.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WONTFIX

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@bootlin.com> ---
Thanks for your bug report.

However, it is really the mfgtools code that is broken: in
libuuu/CMakeLists.txt it overwrites CMAKE_CXX_FLAGS, which means it ignores the
value Buildroot is passing, which contains -I$(HOST_DIR)/include.

If you change:

libuuu/CMakeLists.txt:set(CMAKE_CXX_FLAGS "-O2 ${UUUSSL}")

to:

libuuu/CMakeLists.txt:set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O2 ${UUUSSL}")

suddenly, it will work.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
