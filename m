Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BEECC433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Dec 2021 14:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F08A380BE9;
	Wed, 22 Dec 2021 14:13:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SEoXwUw0F9mi; Wed, 22 Dec 2021 14:13:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC034817FD;
	Wed, 22 Dec 2021 14:13:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E8BC21BF9AF
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 14:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6E7A60E08
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 14:13:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QOWbjXzSLwH8 for <buildroot@lists.busybox.net>;
 Wed, 22 Dec 2021 14:13:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A751E605A3
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 14:13:02 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id x15so9325795edv.1
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 06:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+tkhn3xivwVv+geyYWI4thTNGXDRinfhCuFmW4THkys=;
 b=OgyCwu0N/ruS1Ku1gmlYpxcyJhMNH22UMTKF7ktwVg8YutM9yE/S8vf8E9qq/cYfp7
 n4H6Zwq6EWNBI40+S4PnmVdmHuPKuoCy99uOpku9mqLzuC5TITxizbVpb/U6wzbqzMyx
 DcE6QOQSGtsHz+xse/TWl6MzRpuwS6Nx1YqYHqkVs1e+hTVUu3UNM+jGMO2PlV1o9aGu
 qD6GsJDoerA5Z4RUEFQnC+xjbFpvhEy2fJCUKEVshvirPVGPfc3rY9zzbUG2Sq32qJ40
 vWLloByr2INm6YKa1C4JhBVRlkqY/RCq8jb+wE3xMgskXyF1BxdNL96k86yF8cJT0G7K
 iPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+tkhn3xivwVv+geyYWI4thTNGXDRinfhCuFmW4THkys=;
 b=7zPqs+SbwKor6vdtVX6r+8kb54TwIrPcdO6ESFlWTjbDcp13+jXLcyfCIxv+J7QNDL
 qYIlx1ykG3wUjyVFO9AEo5rSAZmtKfYQtjAQzpzaNd4f4VHD5z0h0kDgQ4DPCmRTUalp
 RcSQvELCDJqesKSmNV4TO/6ajikJ4DzHVFGC6SKbOS50VJyIDsEJpYXnbXthSx2OFZvf
 dZxVGF3zrQ4fHh5PUBcO+1epdHvXh8wLxjprFXeJdO2Z0B4xDRaYJQS/W3KsOf8fOcPt
 h2SxRQ8ug9gQUm4PxlFYtdiwTFMKG786fqN9sr1TPgskwg+6HBS/Bh67VzLYnHX64fw9
 YFKw==
X-Gm-Message-State: AOAM532EjP0U0rymtpn8bFN1tKBhDIcau+joI1vJ0+AaZXiD3SmP/ecs
 jPP0j1W+tKGFE0K7Js+0rl9GGQ==
X-Google-Smtp-Source: ABdhPJzlIA3cmLre5apoCVU0TRz4oJDRsOJyrCurz6x818QeahN/9M7kyvckjvupsAqx5nEyeQFtqg==
X-Received: by 2002:a17:906:af19:: with SMTP id
 lx25mr2598536ejb.338.1640182380336; 
 Wed, 22 Dec 2021 06:13:00 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id u21sm964075eds.8.2021.12.22.06.12.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Dec 2021 06:12:59 -0800 (PST)
Message-ID: <dc4b99fa-1893-d022-ba29-db80c2fc05ba@mind.be>
Date: Wed, 22 Dec 2021 15:12:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Joachim Wiberg <troglobit@gmail.com>, buildroot@buildroot.org
References: <20211222083515.1150267-1-troglobit@gmail.com>
 <20211222083515.1150267-3-troglobit@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211222083515.1150267-3-troglobit@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 2/2] package/makedevs: coding style and
 whitespace cleanup
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Matt Weber <matthew.weber@collins.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/12/2021 09:35, Joachim Wiberg wrote:
> This program is cobbled up with parts from all over the place, mostly
> BusyBox.  This patch is a modest attempt to clean up the coding style
> and fix some whitespace issues.  Some changes, e.g., comments are for
> consistency with the rest fo the program.

  Although I'm OK with the changes per se, I general I don't believe much in 
manually maintained coding style. So I'd propose to at least include a 
.clang-format file in the top level directory that defines our coding style. We 
wouldn't enforce it with CI or anything (at least, not for the time being), but 
at least it makes it easy to apply the coding style and to know that it's correct.

  As to which coding style: something close to kernel is preferred.

  Regards,
  Arnout

> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---
>   package/makedevs/makedevs.c | 74 +++++++++++++++++++++++--------------
>   1 file changed, 47 insertions(+), 27 deletions(-)
> 
> diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
> index 634ae7c3d8..d321b9651a 100644
> --- a/package/makedevs/makedevs.c
> +++ b/package/makedevs/makedevs.c
> @@ -44,7 +44,7 @@ uid_t recursive_uid;
>   gid_t recursive_gid;
>   unsigned int recursive_mode;
>   #define PASSWD_PATH "etc/passwd"  /* MUST be relative */
> -#define GROUP_PATH "etc/group"  /* MUST be relative */
> +#define GROUP_PATH  "etc/group"   /* MUST be relative */
>   
>   void bb_verror_msg(const char *s, va_list p)
>   {
> @@ -76,10 +76,14 @@ void bb_error_msg_and_die(const char *s, ...)
>   
>   void bb_vperror_msg(const char *s, va_list p)
>   {
> -	int err=errno;
> -	if(s == 0) s = "";
> +	int err = errno;
> +
> +	if (s == 0)
> +	  s = "";
>   	bb_verror_msg(s, p);
> -	if (*s) s = ": ";
> +
> +	if (*s)
> +	  s = ": ";
>   	fprintf(stderr, "%s%s\n", s, strerror(err));
>   }
>   
> @@ -99,14 +103,17 @@ void bb_perror_msg_and_die(const char *s, ...)
>   	va_start(p, s);
>   	bb_vperror_msg(s, p);
>   	va_end(p);
> +
>   	exit(1);
>   }
>   
>   FILE *bb_xfopen(const char *path, const char *mode)
>   {
>   	FILE *fp;
> +
>   	if ((fp = fopen(path, mode)) == NULL)
>   		bb_perror_msg_and_die("%s", path);
> +
>   	return fp;
>   }
>   
> @@ -154,8 +161,10 @@ int bb_make_directory (char *path, long mode, int flags)
>   		}
>   
>   		if (mkdir(path, 0777) < 0) {
> -			/* If we failed for any other reason than the directory
> -			 * already exists, output a diagnostic and return -1.*/
> +			/*
> +			 * If we failed for any other reason than the directory
> +			 * already exists, output a diagnostic and return -1.
> +			 */
>   			if ((errno != EEXIST && errno != EISDIR)
>   					|| !(flags & FILEUTILS_RECUR)
>   					|| (stat(path, &st) < 0 || !S_ISDIR(st.st_mode))) {
> @@ -163,9 +172,12 @@ int bb_make_directory (char *path, long mode, int flags)
>   				umask(mask);
>   				break;
>   			}
> -			/* Since the directory exists, don't attempt to change
> +
> +			/*
> +			 * Since the directory exists, don't attempt to change
>   			 * permissions if it was the full target.  Note that
> -			 * this is not an error conditon. */
> +			 * this is not an error conditon.
> +			 */
>   			if (!c) {
>   				umask(mask);
>   				return 0;
> @@ -173,11 +185,13 @@ int bb_make_directory (char *path, long mode, int flags)
>   		}
>   
>   		if (!c) {
> -			/* Done.  If necessary, updated perms on the newly
> +			/*
> +			 * Done.  If necessary, updated perms on the newly
>   			 * created directory.  Failure to update here _is_
> -			 * an error.*/
> +			 * an error.
> +			 */
>   			umask(mask);
> -			if ((mode != -1) && (chmod(path, mode) < 0)){
> +			if ((mode != -1) && (chmod(path, mode) < 0)) {
>   				fail_msg = "set permissions of";
>   				break;
>   			}
> @@ -198,16 +212,20 @@ const char * const bb_msg_memory_exhausted = "memory exhausted";
>   void *xmalloc(size_t size)
>   {
>   	void *ptr = malloc(size);
> +
>   	if (ptr == NULL && size != 0)
>   		bb_error_msg_and_die(bb_msg_memory_exhausted);
> +
>   	return ptr;
>   }
>   
>   void *xcalloc(size_t nmemb, size_t size)
>   {
>   	void *ptr = calloc(nmemb, size);
> +
>   	if (ptr == NULL && nmemb != 0 && size != 0)
>   		bb_error_msg_and_die(bb_msg_memory_exhausted);
> +
>   	return ptr;
>   }
>   
> @@ -216,6 +234,7 @@ void *xrealloc(void *ptr, size_t size)
>   	ptr = realloc(ptr, size);
>   	if (ptr == NULL && size != 0)
>   		bb_error_msg_and_die(bb_msg_memory_exhausted);
> +
>   	return ptr;
>   }
>   
> @@ -249,6 +268,7 @@ char *private_get_line_from_file(FILE *file, int c)
>   		}
>   		linebuf[idx] = 0;
>   	}
> +
>   	return linebuf;
>   }
>   
> @@ -263,7 +283,7 @@ long my_getpwnam(const char *name)
>   	FILE *stream;
>   
>   	stream = bb_xfopen(PASSWD_PATH, "r");
> -	while(1) {
> +	while (1) {
>   		errno = 0;
>   		myuser = fgetpwent(stream);
>   		if (myuser == NULL)
> @@ -284,7 +304,7 @@ long my_getgrnam(const char *name)
>   	FILE *stream;
>   
>   	stream = bb_xfopen(GROUP_PATH, "r");
> -	while(1) {
> +	while (1) {
>   		errno = 0;
>   		mygroup = fgetgrent(stream);
>   		if (mygroup == NULL)
> @@ -312,14 +332,16 @@ unsigned long get_ug_id(const char *s, long (*my_getxxnam)(const char *))
>   	return r;
>   }
>   
> -char * last_char_is(const char *s, int c)
> +char *last_char_is(const char *s, int c)
>   {
>   	char *sret = (char *)s;
> +
>   	if (sret) {
>   		sret = strrchr(sret, c);
> -		if(sret != NULL && *(sret+1) != 0)
> +		if (sret != NULL && *(sret+1) != 0)
>   			sret = NULL;
>   	}
> +
>   	return sret;
>   }
>   
> @@ -437,9 +459,8 @@ void bb_show_usage(void)
>   	exit(1);
>   }
>   
> -int bb_recursive(const char *fpath, const struct stat *sb,
> -		int tflag, struct FTW *ftwbuf){
> -
> +int bb_recursive(const char *fpath, const struct stat *_, int __, struct FTW *___)
> +{
>   	if (lchown(fpath, recursive_uid, recursive_gid) == -1) {
>   		bb_perror_msg("chown failed for %s", fpath);
>   		return -1;
> @@ -467,7 +488,7 @@ int main(int argc, char **argv)
>   	bb_applet_name = basename(argv[0]);
>   
>   	while ((opt = getopt(argc, argv, "d:")) != -1) {
> -		switch(opt) {
> +		switch (opt) {
>   			case 'd':
>   				table = bb_xfopen((line=optarg), "r");
>   				break;
> @@ -528,8 +549,7 @@ int main(int argc, char **argv)
>   		if ((2 > sscanf(line, "%4095s %c %o %40s %40s %u %u %u %u %u", name,
>   						&type, &mode, user, group, &major,
>   						&minor, &start, &increment, &count)) ||
> -				((major | minor | start | count | increment) > 0xfffff))
> -		{
> +				((major | minor | start | count | increment) > 0xfffff)) {
>   			if (*line=='\0' || *line=='#' || isspace(*line))
>   				continue;
>   			bb_error_msg("line %d invalid: '%s'\n", linenum, line);
> @@ -565,16 +585,17 @@ int main(int argc, char **argv)
>   				ret = EXIT_FAILURE;
>   				goto loop;
>   			}
> -			if ((mode != -1) && (chmod(full_name, mode) < 0)){
> +			if ((mode != -1) && (chmod(full_name, mode) < 0)) {
>   				bb_perror_msg("line %d: chmod failed for %s", linenum, full_name);
>   				ret = EXIT_FAILURE;
>   				goto loop;
>   			}
>   		} else if (type == 'f' || type == 'F') {
>   			struct stat st;
> +
>   			if ((stat(full_name, &st) < 0 || !S_ISREG(st.st_mode))) {
>   				if (type == 'F') {
> -					continue; /*Ignore optional files*/
> +					continue; /* Ignore optional files */
>   				}
>   				bb_perror_msg("line %d: regular file '%s' does not exist", linenum, full_name);
>   				ret = EXIT_FAILURE;
> @@ -585,7 +606,7 @@ int main(int argc, char **argv)
>   				ret = EXIT_FAILURE;
>   				goto loop;
>   			}
> -			if ((mode != -1) && (chmod(full_name, mode) < 0)){
> +			if ((mode != -1) && (chmod(full_name, mode) < 0)) {
>   				bb_perror_msg("line %d: chmod failed for %s", linenum, full_name);
>   				ret = EXIT_FAILURE;
>   				goto loop;
> @@ -599,8 +620,7 @@ int main(int argc, char **argv)
>   				ret = EXIT_FAILURE;
>   				goto loop;
>   			}
> -		} else
> -		{
> +		} else {
>   			dev_t rdev;
>   			unsigned i;
>   			char *full_name_inc;
> @@ -619,7 +639,7 @@ int main(int argc, char **argv)
>   				goto loop;
>   			}
>   
> -			full_name_inc = xmalloc(strlen(full_name) + sizeof(int)*3 + 2);
> +			full_name_inc = xmalloc(strlen(full_name) + sizeof(int) * 3 + 2);
>   			if (count)
>   				count--;
>   			for (i = start; i <= start + count; i++) {
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
