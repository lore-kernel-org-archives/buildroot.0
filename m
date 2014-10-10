From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sat, 11 Oct 2014 02:06:30 +0400
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-10-09
In-Reply-To: <CAMo8BfKw9NCroCWfNdcDzxP5ZSX5JsuXtBdZpvx9xs1gMp_7-g@mail.gmail.com>
References: <20141010063012.D7B521012DC@stock.ovh.net>
 <CAMo8BfKw9NCroCWfNdcDzxP5ZSX5JsuXtBdZpvx9xs1gMp_7-g@mail.gmail.com>
Message-ID: <CAMo8BfKarKi9YZ+Emkx2pNgcy86GvbXqJhaaFzYhbEnvzU-=HQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 10, 2014 at 5:49 PM, Max Filippov <jcmvbkbc@gmail.com> wrote:
> On Fri, Oct 10, 2014 at 10:30 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>>       xtensa |                        kmod-18 | NOK | http://autobuild.buildroot.net/results/ccb67643055a63e90f8ffbcc18da7137db6d3fbe/
>>       xtensa |                        kmod-18 | NOK | http://autobuild.buildroot.net/results/89e1a6328e0105021a22858e97f12107ad786782/
>>       xtensa |                        kmod-18 | NOK | http://autobuild.buildroot.net/results/415966eab988b04b3f1ffa5ae1bdb9ff3665c3c1/
>
> That's the same bug with --gc-sections we've put a workaround in
> kmod-17, and now despite the workaround is still applied I see
> --gc-sections in ldflags.

Ok, turns out it's caused by the commit

cc7da47 kmod: add patches to support build on RHEL 5

which added a patch that modifies configure.ac, but does not call reconfigure.
Because of that reconfigure is called at the build step, with empty environment,
leading to build error on xtensa.
However if I add KMOD_AUTORECONF = YES reconfiguring fails with the
following message:

libkmod/docs/gtk-doc.make:270: error: HAVE_GTK_DOC does not appear in
AM_CONDITIONAL

Ideas?
-- 
Thanks.
-- Max
