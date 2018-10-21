From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Oct 2018 11:17:02 +0200
Subject: [Buildroot] TestFileCapabilities is broken
In-Reply-To: <5bc3570246515_5aca3ff0c60b0ff82315@ultri5.mail>
References: <20181014142632.GJ31509@scaer>
 <5bc3570246515_5aca3ff0c60b0ff82315@ultri5.mail>
Message-ID: <20181021091702.GA2439@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2018-10-14 11:47 -0300, Ricardo Martincoski spake thusly:
> On Sun, Oct 14, 2018 at 11:26 AM, Yann E. MORIN wrote:
> 
> > On 2018-10-14 15:25 +0200, Thomas Petazzoni spake thusly:
> >> The TestFileCapabilities test of our test suite is failing, with:
> >> 
> >> ======================================================================
> >> FAIL: test_run (tests.core.test_file_capabilities.TestFileCapabilities)
> >> ----------------------------------------------------------------------
> >> Traceback (most recent call last):
> >>   File "/builds/buildroot.org/buildroot/support/testing/tests/core/test_file_capabilities.py", line 44, in test_run
> >>     self.assertIn("cap_kill", output[0])
> >> AssertionError: 'cap_kill' not found in '/usr/sbin/getcap'
> >> 
> >> I did a local build, and I can reproduce the issue. What we do is we
> >> run "getcap -v /usr/sbin/getcap" on the target, and it returns just:
> >> 
> >> # getcap -v /usr/sbin/getcap 
> >> /usr/sbin/getcap
> >> 
> >> And not any of the extended attributes that getcap is supposed to have.
> >> I had a quick look, and makedevs gets run with a correct device table
> >> when generating the common tarball. I don't know when extended
> >> attributes are lost.
> 
> This is bug #11216

Thanks! With all the information you collected in there, I was able to
come up with a fix (workaround?) which makes the TestFileCapabilities
test-case pass with success.

I'm still doing a few tests here, mostly to come up with a good commit
log, and I should post a patchset by the end of the day.

Regards,
Yann E. MORIN.

> >> 
> >> Could you have a look ?
> > 
> > So, I also did a test build here, and it indeed fails for me too. At
> > first glance, our mksquashfs has support for extended attributes:
> > 
> >     $ ./tests/TestFileCapabilities/host/bin/mksquashfs -h
> >     [...]
> >     -no-xattrs              don't store extended attributes
> >     -xattrs                 store extended attributes (default)
> >     [...]
> > 
> > Further investigation postponed, for cause of a visitor... ;-]
> 
> It looks like the problem occurs when extracting a tarfile with xattrs inside
> fakeroot. See the commands I used in [1]. Unfortunately I don't know how to fix
> this.
> 
> The same test case works fine on the 2018.02.x branch, see [2].
> 
> [1] https://bugs.busybox.net/show_bug.cgi?id=11216
> [2] https://gitlab.com/buildroot.org/buildroot/-/jobs/107232219
> 
> Regards,
> Ricardo


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
