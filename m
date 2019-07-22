From: =?UTF-8?Q?Micka=c3=abl_Tansorier?= <mickael.tansorier@smile.fr>
Date: Mon, 22 Jul 2019 12:01:40 +0200
Subject: [Buildroot] fitImage: proposal to sign images into fitImage
In-Reply-To: <8709f741816ed0a3933a31e7da0b1784f0d44744.camel@lxtreme.nl>
References: <994ab8c3-bf81-2b91-946a-8281105bfc36@smile.fr>
 <8709f741816ed0a3933a31e7da0b1784f0d44744.camel@lxtreme.nl>
Message-ID: <9ecb6929-5ba2-c73f-8c3f-f6a4bc425653@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/07/2019 10:42, Jan Willem Janssen wrote:
> On Mon, 2019-07-22 at 09:07 +0200, Micka?l Tansorier wrote:
>> Hello,
>>
>> In project, I worked to add option in builroot to sign kernel and
>> devicetree image for fitImage.
>>
>> Uboot support fitImage signature check, but buildroot have no option to
>> build fitImage with specific signature.
>>
>> I would like to propose patch, but I'm not sure about the best practice
>> to do that. Have you any suggestion ?
>> I can send you my patch (draft) to improve it.
> 
> Cool, I think this could be a very useful addition to buildroot! You can just mail your
> patch against the buildroot repo to this mailing list (see [1]) to get feedback on it.
Thank you for the reply.

I attach my patch (I adapt it because my project was very specific).
> 
>>
>> My idea is to add variables to get path of `its` file, `dts` to describe
>> public key for uboot, and server where to download keys to sign in
>> Config.in.
>> Then in `uboot.mk`:
>>    - I download keys
>>    - I replace kernel name, dtb name, and keys name in `its` file. (To
>> get right path to its).
>>    - I replace keys name in `dts` file
>>    - I compile `dts` to `dtb` with space to add pubic key
>>    - I compile fitImage with `mkimage`
> 
> That is more or less what I do as well to create my own signed images (only using a custom
> post-image script). Only, I use a small HSM which needs to be addressed through PKCS#11
> which requires some tricks to work properly (I can expand on the details if needed).
> 
> One thing that we need to be careful of is the "key management", or how do we ensure that
> the signing key is not lingering around for longer than necessary or might not even be
> physically available (in case of a HSM).
> 
> Other than this, I think it would be a nice addition to buildroot!
I have limitation in my case, because I can use only one kernel and dtb 
into my its. The reason is I replace path to kernel and dtb by absolute 
path. Maybe, users can anticipate it in there conf.

This is kind of dts and its I use:

u-boot_pubkey.dts
```
/dts-v1/;
/ {
	model = "Keys";
	compatible ="vendor,board";
	signature {
		key-%KEYNAME% {
			required = "image";
			algo = "sha256,rsa4096";
			key-name-hint = "%KEYNAME%";
		};
	};
};
```

fitImage.its
```
/ {
	description = "fitImage for sign Kernel image and DTB";
	#address-cells = <1>;

	images {
		kernel at 1 {
			description = "Linux Kenel";
			data = /incbin/("%KERNEL%");
			type = "kernel";
			arch = "arm";
			os = "linux";
			compression = "none";
			load = <0x15000000>;
			entry = <0x15000000>;
			signature at 1 {
				algo = "sha256,rsa4096";
				key-name-hint = "%KEYNAME%";
			};
		};
		fdt at 1 {
			description = "Devicetree";
			data = /incbin/("%DTB%");
			type = "flat_dt";
			arch = "arm";
			compression = "none";
			load = <0x18000000>;
			entry = <0x18000000>;
			signature at 1 {
				algo = "sha256,rsa4096";
				key-name-hint = "%KEYNAME%";
			};
		};
	};
	configurations {
		default = "conf at 1";
		conf at 1 {
			kernel = "kernel at 1";
			fdt = "fdt at 1";
		};
	};
};
```
> 
> Regards,
> 
>    Jan Willem
> 
> 
> 1. https://buildroot.org/downloads/manual/manual.html#patch-policy
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

Regards,

-- 
Tansorier Micka?l

Smile ECS / OpenWide Ing?nierie
D?l?gu? du Personnel pour l'agence de Nantes

[Pr?serve ta libert?: https://gafam.laquadrature.net/]
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-uboot-Add-config-to-sign-images-in-fitImage.patch
Type: text/x-patch
Size: 4113 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190722/6e20d667/attachment.bin>
