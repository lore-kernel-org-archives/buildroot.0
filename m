From: Roderick Taylor <myopiate@gmail.com>
Date: Tue, 11 Sep 2007 07:45:09 +1000
Subject: [Buildroot] this commit breaks x86_64 toolchain builds
In-Reply-To: <20070907131447.GD17733@aon.at>
References: <e83232070709060559u27a12f78u1ddb96d7c4d7bc20@mail.gmail.com>
	<20070907131447.GD17733@aon.at>
Message-ID: <e83232070709101445l7db6927dx8a166ef8e9db8572@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/09/2007, Bernhard Fischer <rep.dot.nop@gmail.com> wrote:
> On Thu, Sep 06, 2007 at 10:59:56PM +1000, Roderick Taylor wrote:
> >x86_64, by default uses the lib64 directory to hold 64-bit libraries.
> >not the lib directory as assumed by this commit.
>
> I don't see how the patch mentioned below is the culprit?

the "-" infront of the cp means ignore errors.  When you build for
x86_64, buildroot puts libgcc_s* etc. in $(REAL_GNU_TARGET_NAME)/lib64
not in lib.  so this line will produce an error, and because the patch
stops make from ignoring this, the build stops.

-	-cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib/libgcc_s*
$(TARGET_DIR)/lib/
+	cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib/libgcc_s*


> Isn't there a target_gcc_lib_dir we should rather use?
>

I don't know.   I know we can either modify the gcc build to install
into lib instead of lib64 but I haven't tried it.
