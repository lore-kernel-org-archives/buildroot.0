From: Weber, Matthew L                            Collins <Matthew.Weber@collins.com>
Date: Thu, 20 May 2021 20:02:53 +0000
Subject: [Buildroot] [External] [PATCH/NEXT: 01/11] package/libsepol:
 bump to version 3.2
In-Reply-To: <20210520174649.1188340-2-aduskett@gmail.com>
References: <20210520174649.1188340-1-aduskett@gmail.com>,
 <20210520174649.1188340-2-aduskett@gmail.com>
Message-ID: <DM2P110MB0105ED98FD4B279E2894DA12F22A9@DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam,

> From: Adam Duskett <aduskett@gmail.com>
> Sent: Thursday, May 20, 2021 12:46 PM
> To: buildroot at buildroot.org <buildroot@buildroot.org>
> Cc: Antoine Tenart <atenart@kernel.org>; Shotwell, Clayton L Collins <Clayton.Shotwell@collins.com>; Weber, Matthew L Collins <Matthew.Weber@collins.com>; Marcus Folkesson <marcus.folkesson@gmail.com>; Adam Duskett <aduskett@gmail.com>
> Subject: [External] [PATCH/NEXT: 01/11] package/libsepol: bump to version 3.2 
> ?
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

I applied this series against NEXT and ran the following:
  ./support/testing/run-tests  tests.core.test_selinux.TestSELinuxPackage 

However, it failed.  

14:59:59 TestSELinuxPackage                       Starting
15:00:28 TestSELinuxPackage                       Cleaning up

======================================================================
ERROR: test_run (tests.core.test_selinux.TestSELinuxPackage)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/usr/lib/python3/dist-packages/pexpect/expect.py", line 99, in expect_loop
    incoming = spawn.read_nonblocking(spawn.maxread, timeout)
  File "/usr/lib/python3/dist-packages/pexpect/pty_spawn.py", line 462, in read_nonblocking
    raise TIMEOUT('Timeout exceeded.')
pexpect.exceptions.TIMEOUT: Timeout exceeded.

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/accts/mlweber1/wip_patchwork/buildroot/support/testing/tests/core/test_selinux.py", line 76, in test_run
    out, ret = self.emulator.run("seinfo -t ntpd_t", 15)
  File "/accts/mlweber1/wip_patchwork/buildroot/support/testing/infra/emulator.py", line 110, in run
    self.qemu.expect("# ", timeout=timeout)
  File "/usr/lib/python3/dist-packages/pexpect/spawnbase.py", line 321, in expect
    timeout, searchwindowsize, async)
  File "/usr/lib/python3/dist-packages/pexpect/spawnbase.py", line 345, in expect_list
    return exp.expect_loop(timeout)
  File "/usr/lib/python3/dist-packages/pexpect/expect.py", line 107, in expect_loop
    return self.timeout(e)
  File "/usr/lib/python3/dist-packages/pexpect/expect.py", line 70, in timeout
    raise TIMEOUT(msg)
pexpect.exceptions.TIMEOUT: Timeout exceeded.
<pexpect.pty_spawn.spawn object@0x7f7b9dc25d30>
command: /usr/bin/qemu-system-arm
args: [b'/usr/bin/qemu-system-arm', b'-serial', b'stdio', b'-display', b'none', b'-m', b'256', b'-initrd', b'/accts/mlweber1/wip_patchwork/buildroot/runtest/TestSELinuxPackage/images/rootfs.cpio', b'-dtb', b'/accts/mlweber1/vistajet/buildroot/dl/versatile-pb-4.19.dtb', b'-M', b'versatilepb', b'-device', b'virtio-rng-pci', b'-kernel', b'/accts/mlweber1/vistajet/buildroot/dl/kernel-versatile-4.19', b'-append', b'console=ttyAMA0']
buffer (last 100 chars): 'seinfo -t ntpd_t\r\r\n'
before (last 100 chars): 'seinfo -t ntpd_t\r\r\n'
after: <class 'pexpect.exceptions.TIMEOUT'>
match: None
match_index: None
exitstatus: None
flag_eof: False
pid: 34609
child_fd: 11
closed: False
timeout: 5
delimiter: <class 'pexpect.exceptions.EOF'>
logfile: None
logfile_read: <_io.TextIOWrapper name='/accts/mlweber1/wip_patchwork/buildroot/runtest/TestSELinuxPackage-run.log' mode='a+' encoding='UTF-8'>
logfile_send: None
maxread: 2000
ignorecase: False
searchwindowsize: None
delaybeforesend: 0.05
delayafterclose: 0.1
delayafterterminate: 0.1
searcher: searcher_re:
    0: re.compile("# ")

----------------------------------------------------------------------
Ran 1 test in 29.328s

FAILED (errors=1)



I'll see if I can get more details beyond this runtime output that looks like it tried to run.  Maybe the seinfo froze?

  $ tail runtest/TestSELinuxPackage-run.log 
  Running sysctl: OK
  Saving random seed: OK
  Starting network: OK
  
  Welcome to Buildroot
  buildroot login: root
  # dmesg -n 1
  # echo $?
  0
  # seinfo -t ntpd_t
