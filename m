Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC33C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 12:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 478EE81EE9;
	Tue,  6 Feb 2024 12:40:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fkoJpwh-CAva; Tue,  6 Feb 2024 12:40:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3304481F33
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3304481F33;
	Tue,  6 Feb 2024 12:40:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE4F21BF33B
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8730D60AEB
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:40:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8730D60AEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FOAMOL12Z8wK for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 12:39:59 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F79B60AE4
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 12:39:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F79B60AE4
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40fe33fb7a1so4063505e9.2
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 04:39:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707223197; x=1707827997;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vSwZks9nsbe1j9+b5AbqieGX9KS8bV2IRO5foR5qhe4=;
 b=HTexjUuAZfX+7pqPSX/ZDEEifj7ajOmb05xb3g7aNtIvS3/0wmDpATepJFMe6FOqN5
 RwlEdq4+MyQvHTKn9VO3fsJJRGeVZBUhsEQiWbiD4AUJsfMyZ9jJFhBVx93WShQr93+W
 SJ7vd6WrnMgTKLsLQJ8TSWOm2hW6IO37xRBSGvdddS/FVKvkSuZelJ9LVUReDSKE82TU
 zs2f8CsKlVeE2LCZ1XVyESIDsjcwfvb00DT9XvukA5xKyDMgN6GcdppDwRbfAKmWTXfj
 0NyxLi5dOo0g+P185oQHwyiKIIqcbVei57OlcylIBzbvAvhFj8sv0Zf5abp9r6feZC7p
 MU1Q==
X-Gm-Message-State: AOJu0YzCzDrULd1U4CPW2W8wD18ZBB4qYAfp5gB09+flhoeto1vvBsja
 Q8P1Dalfql74Dl6x+65vFQJyyclaUreGosFO+wlaxVF3Oy46FGfJtYEzd7amX/4=
X-Google-Smtp-Source: AGHT+IGjHoYtp5Moenk9yF0GrIz1MfPjgHNQjIZC5ZWt+9uI/i3nSA3ht4WyKxaGIKIqwDPWuC9ckA==
X-Received: by 2002:a05:600c:3d8e:b0:40f:e930:9eb8 with SMTP id
 bi14-20020a05600c3d8e00b0040fe9309eb8mr813964wmb.0.1707223197604; 
 Tue, 06 Feb 2024 04:39:57 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV+9c5Ad+9/0NAhopKxVnKQHWWp0DmjQbW+mCvj6AGypLs2HNyRAHcNN7yuSTmUtJhKRW3PhNSNIdEAbYgs3gPh/Rc8W2OYst7p8AWeVNFkUb70Hr5Y6w9nqMo=
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 hu23-20020a05600ca29700b0040fdf204fe7sm1842438wmb.38.2024.02.06.04.39.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 04:39:57 -0800 (PST)
Message-ID: <300bce9b-5a17-49aa-a946-4bfbac6a7fba@mind.be>
Date: Tue, 6 Feb 2024 13:39:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: ~bubu <bubu@bubu1.eu>, buildroot@buildroot.org
References: <170715461915.13905.5968173515742280918-1@git.sr.ht>
In-Reply-To: <170715461915.13905.5968173515742280918-1@git.sr.ht>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707223197; x=1707827997; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vSwZks9nsbe1j9+b5AbqieGX9KS8bV2IRO5foR5qhe4=;
 b=PYVCylMZ6ydJqYv1J+uJLoCWgWaDLt78Hi+gyaiki8SeSq19FKchToSD+k/Mh53olA
 NKv+X1uZKVJ33O9KXrSWfOpQ7ic6j5Q7Rlhx5km9GRSWkf3r3mkALlMKRXH+euVyfzZK
 vakQYNGBpm4/ZolGbwv5H5wC/NjOqP/maBSlewHruslX0NriUkRHkq6RNLWc1oXvVBmY
 HNYjAmcfAqIN5AqRU0geQ3lux3y2EYOH1/ncpk8ykQj/+GNh6DWb+oYaDvPXTl2oaIV5
 9nN+BZd2TJWQMUyueC09tkaXfRy5jkXu9c3rWV0ENhqK2b3AL1gQFR1AJ0zWrqNOY7+Z
 evCg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PYVCylMZ
Subject: Re: [Buildroot] [PATCH buildroot v2 2/2] support/testing: add
 fastapi runtime test
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/02/2024 18:25, ~bubu wrote:
> From: Marcus Hoffmann <bubu@bubu1.eu>
> 
> Add a runtime test for fastapi. Use uvicorn as the asgi server
> application as does the fastapi hello world example [1].
> 
> Fastapi depends on PydanticV2 now which is written in rust so we need to
> run the test on armv7.
> 
> [1] https://fastapi.tiangolo.com/tutorial/first-steps/
> 
> Signed-off-by: Marcus Hoffmann <bubu@bubu1.eu>

  Both applied to master, but this one with a bunch of modifications:

      - fix flake8 errors
support/testing/tests/package/sample_python_fastapi.py:5:1: E302 expected 2 
blank lines, found 1
support/testing/tests/package/sample_python_fastapi.py:8:1: W391 blank line at 
end of file
      - Remove BR2_CCACHE (as requested by Marcus).
      - Add a comment explaining that this also tests uvicorn and pydantic.
      - Re-try wget in a loop instead of a fixed timeout of 30 seconds.
      - Add a DEVELOPERS entry.


  Regards,
  Arnout

> ---
>   .../tests/package/sample_python_fastapi.py    |  8 ++++
>   .../tests/package/test_python_fastapi.py      | 47 +++++++++++++++++++
>   2 files changed, 55 insertions(+)
>   create mode 100644 support/testing/tests/package/sample_python_fastapi.py
>   create mode 100644 support/testing/tests/package/test_python_fastapi.py
> 
> diff --git a/support/testing/tests/package/sample_python_fastapi.py b/support/testing/tests/package/sample_python_fastapi.py
> new file mode 100644
> index 0000000000..3116df3a93
> --- /dev/null
> +++ b/support/testing/tests/package/sample_python_fastapi.py
> @@ -0,0 +1,8 @@
> +from fastapi import FastAPI
> +
> +app = FastAPI()
> +
> +@app.get("/")
> +async def root():
> +    return {"message": "Hello World"}
> +
> diff --git a/support/testing/tests/package/test_python_fastapi.py b/support/testing/tests/package/test_python_fastapi.py
> new file mode 100644
> index 0000000000..1a78fa6c58
> --- /dev/null
> +++ b/support/testing/tests/package/test_python_fastapi.py
> @@ -0,0 +1,47 @@
> +import os
> +import time
> +
> +from tests.package.test_python import TestPythonPackageBase
> +
> +
> +class TestPythonPy3Fastapi(TestPythonPackageBase):
> +    __test__ = True
> +    config = \
> +        """
> +        BR2_arm=y
> +        BR2_cortex_a9=y
> +        BR2_ARM_ENABLE_NEON=y
> +        BR2_ARM_ENABLE_VFP=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_PACKAGE_PYTHON3=y
> +        BR2_PACKAGE_PYTHON_FASTAPI=y
> +        BR2_PACKAGE_PYTHON_UVICORN=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        BR2_CCACHE=y
> +        BR2_CCACHE_DIR="/home/bubu/.buildroot-ccache"
> +        """
> +    sample_scripts = ["tests/package/sample_python_fastapi.py"]
> +    timeout = 60
> +
> +    def test_run(self):
> +        self.login()
> +        self.check_sample_scripts_exist()
> +        cmd = "uvicorn sample_python_fastapi:app > /dev/null 2>&1 &"
> +
> +        _, exit_code = self.emulator.run(cmd, timeout=self.timeout)
> +
> +        # Give enough time for the uvicorn server to start up
> +        time.sleep(30)
> +
> +        cmd = "wget -q -O - http://127.0.0.1:8000/"
> +        output, exit_code = self.emulator.run(cmd, timeout=self.timeout)
> +        self.assertEqual(exit_code, 0)
> +        self.assertEqual(output[0], '{"message":"Hello World"}')
> +
> +    def login(self):
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv7",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +        self.emulator.login()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
