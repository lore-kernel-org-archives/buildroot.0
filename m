From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Fri, 20 Nov 2009 17:19:25 +0100
Subject: [Buildroot] [RFC] *clean targets
In-Reply-To: <20091120152853.GV919@mx.loc>
References: <20091007162422.GI10261@mx.loc> <20091009095152.555ceed2@surf>
	<20091009100008.7d0f2c65@surf> <20091009094809.GH2266@mx.loc>
	<87my40hkmz.fsf@macbook.be.48ers.dk>
	<87vdh5gxeh.fsf@macbook.be.48ers.dk> <20091120152853.GV919@mx.loc>
Message-ID: <20091120161925.GW919@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Nov 20, 2009 at 04:28:53PM +0100, Bernhard Reutner-Fischer wrote:
>On Fri, Nov 20, 2009 at 02:04:38PM +0100, Peter Korsgaard wrote:
>>>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:
>
>> Peter> So in other words, we should just have clean and distclean, where the
>> Peter> only difference between those two is that clean doesn't delete your
>> Peter> .config?
>>
>>No objections? Ok, I'll implement it like that then.
>
>I'd keep conf,mconf and related .o on clean

.. and of course keep DL_DIR

so, to come back to my initial proposal

# wipe target and staging dirs (think %-uninstall):
clean:
# remove generated files, retain: configs and DL_DIR, {m,}conf{,.o}, host-*:
realclean:
# remove generated files, including configs {m,}conf host-* (but not DL_DIR!):
# think git clean -d -x
distclean:
# make a release tarball; see how existing DL_DIR does not matter:
dist release: FOO=buildroot VERS=1.2.3
	git archive --prefix $(FOO)-$(VERS) HEAD | tee >(bzip2>$(FOO).tar.bz2) >(gzip>$(FOO).tar.gz) | xv>$(FOO).tar.xv
