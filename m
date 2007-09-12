From: Roderick Taylor <myopiate@gmail.com>
Date: Wed, 12 Sep 2007 22:54:35 +1000
Subject: [Buildroot] this commit breaks x86_64 toolchain builds
In-Reply-To: <20070911183533.GD20058@aon.at>
References: <e83232070709060559u27a12f78u1ddb96d7c4d7bc20@mail.gmail.com>
	<20070907131447.GD17733@aon.at>
	<e83232070709101445l7db6927dx8a166ef8e9db8572@mail.gmail.com>
	<20070911183533.GD20058@aon.at>
Message-ID: <e83232070709120554h3d995dfdwbc055e701b271f80@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/09/2007, Bernhard Fischer <rep.dot.nop@gmail.com> wrote:
> On Tue, Sep 11, 2007 at 07:45:09AM +1000, Roderick Taylor wrote:
> >On 07/09/2007, Bernhard Fischer <rep.dot.nop@gmail.com> wrote:
> >> On Thu, Sep 06, 2007 at 10:59:56PM +1000, Roderick Taylor wrote:
> >> >x86_64, by default uses the lib64 directory to hold 64-bit libraries.
> >> >not the lib directory as assumed by this commit.
> >>
> >> I don't see how the patch mentioned below is the culprit?
> >
> >the "-" infront of the cp means ignore errors.  When you build for
> >x86_64, buildroot puts libgcc_s* etc. in $(REAL_GNU_TARGET_NAME)/lib64
> >not in lib.  so this line will produce an error, and because the patch
> >stops make from ignoring this, the build stops.
> >
> >-      -cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib/libgcc_s*
> >$(TARGET_DIR)/lib/
> >+      cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib/libgcc_s*
> >
> >
> >> Isn't there a target_gcc_lib_dir we should rather use?
> >>
> >
> >I don't know.   I know we can either modify the gcc build to install
> >into lib instead of lib64 but I haven't tried it.
>
> If the cp errors are ignored, you'd have no libgcc on the target, is
> that assumption correct? If so, the we have to handle lib64 in a better
> way. Please verify and let me know..
>
> TIA,
>

Yes, libgcc is missing from the target, but I'm not having any
problems running programs (Although, the only programs I've tested
busybox and lspci)

I think a better way is to configure gcc to use
$(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib and not lib64

Here is an small patch for gcc to do this.  I have tested it with
gcc-4.2.1 in buildroot and it works.  i.e. libgcc_s.so* are placed in
$(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib and subsequently copied
to the target.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: swaplibdirs.patch
Type: text/x-patch
Size: 449 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070912/3608dde2/attachment.bin 
