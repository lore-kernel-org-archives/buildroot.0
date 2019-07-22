From: Jan Willem Janssen <j.w.janssen@lxtreme.nl>
Date: Mon, 22 Jul 2019 10:42:35 +0200
Subject: [Buildroot] fitImage: proposal to sign images into fitImage
In-Reply-To: <994ab8c3-bf81-2b91-946a-8281105bfc36@smile.fr>
References: <994ab8c3-bf81-2b91-946a-8281105bfc36@smile.fr>
Message-ID: <8709f741816ed0a3933a31e7da0b1784f0d44744.camel@lxtreme.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2019-07-22 at 09:07 +0200, Micka?l Tansorier wrote:
> Hello,
> 
> In project, I worked to add option in builroot to sign kernel and 
> devicetree image for fitImage.
> 
> Uboot support fitImage signature check, but buildroot have no option to 
> build fitImage with specific signature.
> 
> I would like to propose patch, but I'm not sure about the best practice 
> to do that. Have you any suggestion ?
> I can send you my patch (draft) to improve it.

Cool, I think this could be a very useful addition to buildroot! You can just mail your
patch against the buildroot repo to this mailing list (see [1]) to get feedback on it.

> 
> My idea is to add variables to get path of `its` file, `dts` to describe 
> public key for uboot, and server where to download keys to sign in 
> Config.in.
> Then in `uboot.mk`:
>   - I download keys
>   - I replace kernel name, dtb name, and keys name in `its` file. (To 
> get right path to its).
>   - I replace keys name in `dts` file
>   - I compile `dts` to `dtb` with space to add pubic key
>   - I compile fitImage with `mkimage`

That is more or less what I do as well to create my own signed images (only using a custom
post-image script). Only, I use a small HSM which needs to be addressed through PKCS#11
which requires some tricks to work properly (I can expand on the details if needed).

One thing that we need to be careful of is the "key management", or how do we ensure that
the signing key is not lingering around for longer than necessary or might not even be
physically available (in case of a HSM).

Other than this, I think it would be a nice addition to buildroot!

Regards,

  Jan Willem


1. https://buildroot.org/downloads/manual/manual.html#patch-policy
