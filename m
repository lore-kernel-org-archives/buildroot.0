From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 13 Sep 2013 20:27:02 +0200
Subject: [Buildroot] [PATCH v2] apply-patches.sh: detect missing patches
In-Reply-To: <20130913181527.GA11933@harvey.netwinder.org>
References: <20130813160017.GA2590@harvey.netwinder.org>
 <CAAXf6LXBHm7nG__780PqUaO+v9+4j2KON7UO0dw4Ej2qC3=XGg@mail.gmail.com>
 <CAAXf6LV9HPWdzqV_F5zQ+aABtVxZGRRkhDszF2Qx8vyXMb+PhA@mail.gmail.com>
 <20130905100459.13173009@skate> <5228425A.7090502@lucaceresoli.net>
 <20130905140135.GC3136@free.fr>
 <CAAXf6LWWnb5xQUtZA8p3kgoU2et-kD6x9TzyzXykgNbxdsuv+Q@mail.gmail.com>
 <20130911120630.GA14745@harvey.netwinder.org>
 <CAAXf6LX7o9P1tXv3Egk8By-VbzarRYe5JRyTh5+3wYNBz9Z6aQ@mail.gmail.com>
 <20130913181527.GA11933@harvey.netwinder.org>
Message-ID: <20130913182702.GB3301@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ralph, All,

On 2013-09-13 14:15 -0400, Ralph Siemsen spake thusly:
> The return status of the "cat <patchfile> | patch ..." pipeline
> is zero (success) even if the patchfile does not exist. This is
> because patch receives no input, which is not an error condition.
> Therefore, explicitly check that patch file exists.
> 
> Based on feedback on buildroot mailing list, also changed the
> check for unsupported file format. The build will now error out,
> rather than continuing on silently.
> ---
> 
> Hi Thomas,
> Hopefully the formatting is now correct.
> -Ralph
> 
> diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
> index 7d5856c..d6e8983 100755
> --- a/support/scripts/apply-patches.sh
> +++ b/support/scripts/apply-patches.sh
> @@ -70,13 +70,17 @@ function apply_patch {
>  	*.patch*)
>  	type="patch"; uncomp="cat"; ;;
>  	*)
> -	echo "Unsupported format file for ${patch}, skip it";
> -	return 0;
> +	echo "Unsupported format file for ${path}/${patch}";
> +	return 1;

I was a bit surprised to read that you used "return 1" here, rather than
a more explicit "exit 1".

For example, if the patch failed to apply cleanly, the function does not
"return 1" but does "exit 1" (just the line after your patch ends). So I
would prefer this behaviour to be homogeneous across the different
code-paths.

For the records, "return 1" does work since we call apply_patch thus:
    apply_patch "${patchfile}" || exit 1

This is not really straightforward. Just remove the "|| exit 1" and
change all the "return 1" into "exit 1", so the script really errors out
right away.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
