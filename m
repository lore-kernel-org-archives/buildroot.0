From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 19 Feb 2018 22:41:29 +0000
Subject: [Buildroot] [Bug 10781] New: cryptsetup luksOpen container_file
 container causes libdevmapper segfault
Message-ID: <bug-10781-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10781

            Bug ID: 10781
           Summary: cryptsetup luksOpen container_file container causes
                    libdevmapper segfault
           Product: buildroot
           Version: 2018.02
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: jsmr at gmx.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

# creating container file works
dd if=/dev/urandom of=container_file bs=1M count=10
cryptsetup -y luksFormat container_file

cryptsetup --debug open container_file container
# cryptsetup 2.0.1 processing "cryptsetup --debug open container_file
container"
# Running command open.
# Locking memory.
# Installing SIGINT/SIGTERM handler.
# Unblocking interruption on signal.
# Allocating context for crypt device container_file.
# Trying to open and read device container_file with direct-io.
# Initialising device-mapper backend library.
# Trying to load any crypt type from device container_file.
# Crypto backend (OpenSSL 1.0.2n  7 Dec 2017) initialized in cryptsetup library
version 2.0.1.
# Detected kernel Linux 4.15.0 i686.
# PBKDF pbkdf2, hash sha256, time_ms 2000 (iterations 0), max_memory_kb 0,
parallel_threads 0.
# Reading LUKS header of size 1024 from device container_file
# Key length 32, device size 20480 sectors, header size 2050 sectors.
# Activating volume container using token -1.
# Interactive passphrase entry requested.
Enter passphrase for container_file:
# Activating volume container [keyslot -1] using passphrase.
# dm version   [ opencount flush ]   [16384] (*1)
# dm versions   [ opencount flush ]   [16384] (*1)
# Detected dm-ioctl version 4.37.0.
# Device-mapper backend running with UDEV support disabled.
# dm status container  [ opencount flush ]   [16384] (*1)
Segmentation fault

dmesg
cryptsetup[150]: segfault at bf779fc4 ip b7eb6cf7 sp bf779fc8 error 6 in
libdevmapper.so.1.02[b7e84000+44000]

I changed original supplied version 2.0.0 to 2.0.1 but it?s still not working.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
