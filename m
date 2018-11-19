From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 19 Nov 2018 20:29:21 +0100
Subject: [Buildroot] [RFC 2/4] support/testing: add perl-time-hires test
In-Reply-To: <5bf20e8e32505_3eca3f955807cd6c210f5@ultri5.mail>
References: <20181117175244.23594-3-francois.perrad@gadz.org>
 <5bf20e8e32505_3eca3f955807cd6c210f5@ultri5.mail>
Message-ID: <CAB0FRsuRPxXBA80jCnj8WLvNHvZEujWY+CA5-AqVG6q_u5RkTg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le lun. 19 nov. 2018 ? 02:14, Ricardo Martincoski <
ricardo.martincoski@gmail.com> a ?crit :

> Hello,
>
> Just giving an example of what I mentioned in a reply to the cover
> letter...
>
> On Sat, Nov 17, 2018 at 03:52 PM, Francois Perrad wrote:
>
> [snip]
> > +class TestPerlTimeHiRes(TestPerl):
> > +    config = TestPerl.config + \
> > +        """
> > +        BR2_PACKAGE_PERL_TIME_HIRES=y
> > +        """
> > +
> > +    def test_run(self):
> > +        self.login()
> > +        self.module_test("Time::HiRes")
>
> Another way to test a perl package would be to have an script added to the
> image
> in build time, something like this:
> sample_perl_time_hires.pl:
> |use Time::HiRes;
> |
> |Time::HiRes::usleep(1_000_000)
>
> And call:
> perl sample_perl_time_hires.pl
>
> This way we could test scripts with a few lines of code and keep it
> readable in
> the tree.
>
>
With the current TestPerl class, this test could be written as:
        self.module_test("Time::HiRes", "Time::HiRes::usleep(1_000_000);")
A long oneliner script could be written with a multiline layout, like this:
        self.module_test("Time::HiRes", "use strict;" +
                                        "use warnings;" +
                                        "Time::HiRes::usleep(1_000_000);")
So, we don't need to handle sample_perl_*.pl scripts.
Same thing with Lua.

Fran?ois


>
> Regards,
> Ricardo
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181119/cf8991c4/attachment.html>
