From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  3 Feb 2011 11:25:39 +0000 (UTC)
Subject: [Buildroot] [Bug 3205] New: Failing chmod when running "make" in
 buildroot (openssl). /usr/lib should have been /usr/lib64
Message-ID: <bug-3205-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3205

           Summary: Failing chmod when running "make" in buildroot
                    (openssl). /usr/lib should have been /usr/lib64
           Product: buildroot
           Version: 2010.11
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: daniel at visp.name
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 2911
  --> https://bugs.busybox.net/attachment.cgi?id=2911
Buildroot "make" output

> make[1]: Leaving directory `/usr/src/buildroot-2010.11/output/build/openssl-1.0.0b'
> rm -rf /usr/src/buildroot-2010.11/output/target/usr/lib/ssl
> rm -f /usr/src/buildroot-2010.11/output/target/usr/bin/c_rehash
# libraries gets installed read only, so strip fails
> chmod +w /usr/src/buildroot-2010.11/output/target/usr/lib/engines/lib*.so
> chmod: cannot access `/usr/src/buildroot-2010.11/output/target/usr/lib/engines/lib*.so': No such file or directory
> make: *** [/usr/src/buildroot-2010.11/output/build/openssl-1.0.0b/.stamp_target_installed] Error 1


If failes to chmod the files because the engines catalog is in lib64 instead.
Added a symlink as a workaround, but then it also tried to chmod libssl.so.*
and libcrypto.so.* in the same catalog with the same result. Was able to make
it continue by touching those files and setting the permissions, then removing
the dummy files afterwards. See attached files for more detailed output

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
