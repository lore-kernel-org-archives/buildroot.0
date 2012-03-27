From: Will Newton <will.newton@gmail.com>
Date: Tue, 27 Mar 2012 11:21:14 +0100
Subject: [Buildroot] Host libxml-parser-perl build issue
In-Reply-To: <20120326210649.483c81d9@skate>
References: <CAFbHwiSJuD+cJRiiLRWM9siAmuCvSBH+25DTS_0CPgN3WxSbLA@mail.gmail.com>
 <20120326192243.6bb4e9d4@skate>
 <CAFbHwiQQwBbj84r0cJAT+eJasO0_UZxn=cGQadNwdr7ph7TFQw@mail.gmail.com>
 <20120326210649.483c81d9@skate>
Message-ID: <CAFbHwiR8gSnDJ8qh=0C1ntoCmTu2QoY8s=2hr0-dQjo=V8mmvw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 26, 2012 at 8:06 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Mon, 26 Mar 2012 18:54:11 +0100,
> Will Newton <will.newton@gmail.com> a ?crit :
>
>> Yes, that's what it looks like. I can get a full log of build output
>> when I am back in the office.
>
> Ok.
>
>> > If so, do you have Perl to the target enabled in your configuration?
>>
>> No, the only perl stuff being built is for host tool dependencies.
>
> Ah, ah, strange. So far, our conclusion was that this issue was related
> to the selection of Perl for the target. At least that's what we can
> conclude from the build tests visible at http://autobuild.buildroot.net.
>
> So definitely, having your .config + build log would be interesting.

Attached is the config and build log (only the last part as I forgot
to tee to a file!). The host system has the following installed:

[win at lemeta01 buildroot]$ rpm -q expat
expat-1.95.8-8.3.el5_5.3
expat-1.95.8-8.3.el5_5.3
[win at lemeta01 buildroot]$ rpm -q perl
perl-5.8.8-32.el5_5.2

I get a failure when I try and load XML::Parser without LD_LIBRARY_PATH set:

[win at lemeta01 buildroot]$ PERLLIB=./output/host/usr/lib /usr/bin/perl
-e "require XML::Parser"
Can't locate XML/Parser.pm in @INC (@INC contains:
./output/host/usr/lib
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi
/usr/lib/perl5/site_perl/5.8.8 /usr/lib/perl5/site_perl
/usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi
/usr/lib/perl5/vendor_perl/5.8.8 /usr/lib/perl5/vendor_perl
/usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi /usr/lib/perl5/5.8.8
.) at -e line 1.
[win at lemeta01 buildroot]$ PERLLIB=./output/host/usr/lib/perl
/usr/bin/perl -e "require XML::Parser"
Can't load './output/host/usr/lib/perl/auto/XML/Parser/Expat/Expat.so'
for module XML::Parser::Expat: libexpat.so.1: cannot open shared
object file: No such file or directory at
/usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi/DynaLoader.pm line
230.
 at output/host/usr/lib/perl/XML/Parser.pm line 14
Compilation failed in require at output/host/usr/lib/perl/XML/Parser.pm line 14.
BEGIN failed--compilation aborted at
output/host/usr/lib/perl/XML/Parser.pm line 18.
Compilation failed in require at -e line 1.
[win at lemeta01 buildroot]$ PERLLIB=./output/host/usr/lib/perl
LD_LIBRARY_PATH=./output/host/usr/lib /usr/bin/perl -e "require
XML::Parser"
-------------- next part --------------
A non-text attachment was scrubbed...
Name: perl_build_failure.config
Type: application/octet-stream
Size: 22724 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120327/15ba16e1/attachment-0002.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: perl_build_failure.log
Type: application/octet-stream
Size: 86811 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120327/15ba16e1/attachment-0003.obj>
