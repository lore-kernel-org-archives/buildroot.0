From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 26 Jun 2015 20:26:03 +0200
Subject: [Buildroot] Buildroot runtime test infrastructure prototype
In-Reply-To: <CAAXf6LUW3rc14Eb+3GjxCUXB8DJv2sCqC5KSdEbmf6+uFsVhBQ@mail.gmail.com>
References: <20150625200235.083eaf34@free-electrons.com>
 <CAAXf6LUW3rc14Eb+3GjxCUXB8DJv2sCqC5KSdEbmf6+uFsVhBQ@mail.gmail.com>
Message-ID: <CAAXf6LUFuVDyK2Spv278WA9T6Es56hqJ1vBuo1fdKV6gD7obGg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 26, 2015 at 8:12 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Hi Thomas,
>
> On Thu, Jun 25, 2015 at 8:02 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Hello,
>>
>> Our http://autobuild.buildroot.org tests are great, but they are only
>> build-time tests, and they only test random configurations of packages.
>> Things like bootloader packages, filesystem images, kernel build are
>> never tested in an automated way, and no runtime testing is done. I
>> also want to be able to build small test programs exercising specific
>> features and run them on the target.
>>
>> Since a while, I wanted to setup a small infrastructure to be able to
>> describe specific test cases: a Buildroot configuration to build, with
>> the ability to boot some of those configurations automatically in Qemu.
>>
>> So I finally went ahead and create such a small infrastructure. It's
>> very basic and minimal right now, and should be considered as an
>> experiment. It's available at:
>>
>>    https://github.com/tpetazzoni/buildroot-runtime-test
>>
>> It's based on the Python unittest mechanism, and allows to describe
>> test cases that consist in a Buildroot defconfig, plus a Python
>> function that can do some checks on the resulting build, boot the
>> system under Qemu, run some commands inside the Qemu system and check
>> their results.
>>
>> I've written a few tests to show how it could work: simple tests for
>> Dropbear and Python (on the package side) and several tests for
>> filesystem images: ext2/3/4, squashfs, jffs2, ubi, iso9660, yaffs2 (all
>> of them are boot tested, except yaffs2).
>>
>> For now, it's very crude and basic. The README file explains how it
>> works, and gives a TODO listing some of the things that for sure need
>> to be improved.
>>
>> Currently, this runtime test infrastructure is not set up to be
>> executed every day on the latest Git, but it is obviously the goal.
>>
>> Contributions, comments and suggestions are welcome.
>
> A while ago I learned about pyTest, an alternative test suite over unittest.
> The website http://pytest.org/latest/ contains good documentation, but
> some benefits:
>
> - intelligent asserts: you can just write 'assert <expression>' where
> expression can be any Python expression. For example, 'assert x == 3'
> or 'assert "Login:" in output'. You don't need special 'assertEqual',
> 'assertNotEqual', 'assertIn', etc. Pytest will analyze these assert
> statements and do the right thing. Also, the error reporting in case
> the assert is not met is quite intelligent and much better than
> standard output of unittest.
> (http://pytest.org/latest/assert.html#assert-with-the-assert-statement)
>
> - parametrization of tests: it is very easy to run the same test with
> different parameters. Say that you want to repeat the JFFS2 test, but
> with a slightly different config.
> (http://pytest.org/latest/parametrize.html#parametrized-test-functions)

- and I forgot: fixtures. It makes it easy to create some building
blocks that different tests can build upon. A fixture can then perform
some common action without needing to copy/paste it all the time.
http://pytest.org/latest/fixture.html#fixture

>
> To convert the existing code you have to use pytest isn't much work, really.
> In fact, you can already run the existing unittests through pytest
> without changes. You would just call
> py.test. (after installing it with 'pip install pytest'; you may like
> 'pip install pytest-sugar' too.
>
> Best regards,
> Thomas
