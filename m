From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Oct 2018 16:26:32 +0200
Subject: [Buildroot] TestFileCapabilities is broken
In-Reply-To: <20181014152543.2cf6c0b2@windsurf>
References: <20181014152543.2cf6c0b2@windsurf>
Message-ID: <20181014142632.GJ31509@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-10-14 15:25 +0200, Thomas Petazzoni spake thusly:
> The TestFileCapabilities test of our test suite is failing, with:
> 
> ======================================================================
> FAIL: test_run (tests.core.test_file_capabilities.TestFileCapabilities)
> ----------------------------------------------------------------------
> Traceback (most recent call last):
>   File "/builds/buildroot.org/buildroot/support/testing/tests/core/test_file_capabilities.py", line 44, in test_run
>     self.assertIn("cap_kill", output[0])
> AssertionError: 'cap_kill' not found in '/usr/sbin/getcap'
> 
> I did a local build, and I can reproduce the issue. What we do is we
> run "getcap -v /usr/sbin/getcap" on the target, and it returns just:
> 
> # getcap -v /usr/sbin/getcap 
> /usr/sbin/getcap
> 
> And not any of the extended attributes that getcap is supposed to have.
> I had a quick look, and makedevs gets run with a correct device table
> when generating the common tarball. I don't know when extended
> attributes are lost.
> 
> Could you have a look ?

So, I also did a test build here, and it indeed fails for me too. At
first glance, our mksquashfs has support for extended attributes:

    $ ./tests/TestFileCapabilities/host/bin/mksquashfs -h
    [...]
    -no-xattrs              don't store extended attributes
    -xattrs                 store extended attributes (default)
    [...]

Further investigation postponed, for cause of a visitor... ;-]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
