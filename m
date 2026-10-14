Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B596CCC6B1A
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 16:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F1AE407B2;
	Wed, 14 Oct 2026 16:46:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tbUlwAbXivmR; Wed, 14 Oct 2026 16:46:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5F87A40560
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791996417;
	b=obB8HyHEk3KQpUnIOT77fjC9aHW8lLoUIjLIjk227FSZRH/hjZ72CryIAfa6g7CFOfaV
	 8lkSzfgz+tTPhhgBXGfPyhZf3tAUuQL8XhHacPStQ7DHdokGVOYm9R1NzKgdOcMUeLwgv
	 4PpbkOL0h98aEuCfDYqjCYOsRigogyCApb6WFbTxv+M8E3xp8YXzaBr62e3pgvs3b95I3
	 rbtUSlzjIPap2bLYoYz9yWUTBbimh6AQbbOgoLL70bLwNy+9ggCQT7Xtul42di4xpabgE
	 SNMsViLeHtcHlPcihss1XRk86wpHyJZCldVO8T+qVjy0/Q+1uZ1gXO5p7CA+CD92hKQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791996417;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=My2ypKjS1k+miMVHnMNfzkasqpEEGl5OQP2kCge0xO0=;
	b=aNFTy1ZQgQFTfeqOnfIZSDEfDyfSup3EdmT2VmyqCmspe8RdVBBuXkjbToUJx9JJ3Ocq
	 Ss1MZt5L3usBmbX/vmUcW4flV/FCcUXSEK4QZdZ5SbDbQN3bW/V2QZWmVSvsrQH5N8s2p
	 kP2cm1TQkoyttk+n6creIxeMvYiAUyfF3weZyI2VPAITdLOXuYd+AmkjWgqKY0JtxqTl1
	 Qj9+Co/29aZQ1VxOoM4yp+O0LX1kpmixxpDfshW5tajNfGDyB3X4b9X+jaTnFy3WRp3T/
	 B07uRmRw46WFXsZRXjk6rLA8cQ0sWspwcfesppLHf7R0XLEpObtht+TITix8fov2uWA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791996417;
	bh=My2ypKjS1k+miMVHnMNfzkasqpEEGl5OQP2kCge0xO0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GagVOjG6PnFqvh1qlfx8oDlAR7thSl+4GaCiaYTD/2Hg7CnkGkrSp0S6RJMMJfCRN
	 QZQWcbaDczjfiv/0LlwTJUNqHGSug0p9EMzj3GMnrs+/LHHptNPZw7mcmui7+bAQpR
	 mpmYEYOPg84b0w/L8O1E6vpZdoA9H7moHL1aN/2qoj515ASnAfsLHP+KMiA/9SzOXc
	 yLpR+kh61lFJttYv8qSDf5PhCYUNQfH9Cdtq8x4oa6yy4gpcDubwKx/tI9lLf8ZPDe
	 vL1+AGib1lFxMHfGrbSWoBNBgGe/5d+lLO6WIQC4+b+B80IVI9QLcycvkC+NobuSKi
	 ByeRWmGuFqsQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F87A40560;
	Wed, 14 Oct 2026 16:46:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CBB8A58
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 16:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E1EC80E25
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 16:46:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tg4kHcfKP2jq for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 16:46:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9750D80E15
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791996414;
 b=fXDOsUtzlLBdvG02NMLYAJA9eItlmniQ6LWDicH6/P8tAgnTIgRFHmJ49PXEXYSi1NZ2
 vulaIAJQFFoT+Bjqnce+4sfi9v+TWUl9ZYDp1BZWQaOuNz8Iw53RnbTmmpiNqTBIh0g7W
 iDS8D3PIIb+wehN6UVZnCtmgQWIAZlFHgqG9QOZE4eKCT7yt4kL6zozKlxleywttFFHLx
 2fseq7SspW2X3+3HxepG18QED1W3iK1C/+kz67YDltq/3oyohgege1piaN5TmL3YLmL/G
 L55u7rVuMGgVAsfolUvNN0qJAC1n5eWZe/NMrbWZb16wwRDfmzd1/NpXa9q8WzNQrKQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791996414;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=2FuuJU2A1WoOZgH9V1v41WD74sy549RPh7lLkiqXFG8=;
 b=ruUarjP2XVx/3ZiL+eeq+Wn8UZnjIv2LuaeoKFQQb2YTOan1cxa6TmHMQIhagP5k8AKX
 9wZUG9GutIlYwscfx7LHByecTCcY2ThFw4RfOAClOKhkwwdboVJz0bBjTj5BXOeFFBv0U
 DuZWvaGWOuVtMHdkUgYZ9Y8iUsaCMcPpvaRVzReZKevp6FVY+tYxyf8SG4IRH4Ftft579
 N396S80A1jV+tWF44Pd2hbRbRItHDkOOc0nHRelHunVJ02x+cbdd7ehgQFygHvxIRIrDG
 ytCmZa7pJQIF34IQEJmMleCOAiJLWJdP1CQs5Dbj0qiohQ6WzMmJ+UOmcpKy0o/LVNw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b="hTI3LX/Z"; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9750D80E15
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 16:46:52 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MVvPJ-1x6tcY0U7x-00P55G; Wed, 14
 Oct 2026 18:46:47 +0200
To: buildroot@buildroot.org
Cc: Jarkko Sakkinen <jarkko@kernel.org>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Wed, 14 Oct 2026 18:46:24 +0200
Message-ID: <20261014164625.1474866-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014164625.1474866-1-fiona.klute@gmx.de>
References: <20261014164625.1474866-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:oQFhPbdeM5h8kTPP9+EuKdv8rIMvvtJAsTxxVy8wfZL5mcnrNtY
 FquHxy7xSBGLMuDfbWY9OaqjSDtHIpZzPbv7vJ+mL2YOGDcfWEPrsB43Sb57euHe0FBY6Ea
 rRSzHOv3kA0EJdE6ukzcglQLPC2u13Hk9W5icbPTBpmWO+NijtyGdnMo+5tkF2WPEa1ZCra
 x1J6o3T4C8pd0cNp2O6hA==
UI-OutboundReport: notjunk:1;M01:P0:xniJ8w3qXTM=;eKlEWkJYC+hemzcA0l3HxjWcRXH
 WUy7be7cFn/WpYJzZ8Lhe0I0WIAKWN8fDR6rmn5hP31lC3FVIo7PJtCS6OfqK1XXMluKaPasD
 Rl376GuoU8dRTbnpLox/9skw9EByaDMMk6fu6fo9Dqmf1nLEf3jBGi1Na7dMDJRKZJSZbEAfK
 XlESHcwRlLq3j5+koFL48Ve+b7cRhLNsCTpD9enCTcBp1iXL1jOrfAtasmXTQXj7u+hGwVN61
 GFO59P9owLRc8tkMEiX5ayFUuyQYaBsrAwb3e/GIFSjVaSBz1wXIC/eb506svusqm8f1uKZTG
 XRmZAAsr2QvA2xxhCQ7MHMDVNtoPWrSjwPKdwQfYMYM0tgL4nGnIBKsKfYdKhJFtjY0bpSaJL
 fQogvPWsRR6waTWKij4fiPsJpmBNFH+Eh/rZExiNqUvdbSs7PAYJnZMdOdoOHwwQy8woLZxCU
 cGj367HBs05rcbZzBAi9FO50Zsa/vn1WRy9k5nksRxlRhM5AqVwajeKEvNnese9NcRb323k5b
 JD/aGWstoUdQLwLM1GU0Gjdz9xPcqf6o6PiQ8d4M3fHIsNLs3Kay7crlWyVcvnddwBQuIKCmE
 XaFPvIx1aGpJ7TWLERKcf+SnUBHmOz4z6Jjbbf6LRBwef9KKipF008Tz5Q2euayR+2XgyrRtG
 eL6JjDA9VeUwfOcclsUh+iGA1pEuP6urT9+Ei4+OsH5uMMutl34fzw2SfSFjZKdqOjKk3mvi9
 VzATspSWeeSY+ASWeRi9UZvTU8ZvtROBJiXYydyWPvdOCPXQ5uxv9TW1M19kfWdFDvPhC8Onq
 Gg0NjZfh/6XW/JENhsvPInGbKeV5CH9xEBrjFWwMoPsOTegmTtY/iC19rZyI0Lg8PPDkWrTld
 U8tftB99gT7luP17WaQMd/DrHbDMXwEepYeBMq4Kxu3HeG6LZf2PL7geckMcvovwyvbGqSfR4
 EyDbTmyJhm4uzwCbb+3iB0DPFDgAQkoi63ijxzVjMGPNR9qZVMO+QF9CxqDXeWCswF8P8qyOw
 lUDT5sDNKTwOcxtM9CIthTUgwvV+7VZDhnBPgPplP/xmNoLOxYsw0eKUmeG1adIFQcM2AtJ9I
 e/5FlrOILe45+Lck0W3U1+XcvKnJ54DpAL/vcR4+b1IMJA97rQHrELIAUQ8uRv1QwGufX7lx+
 hy3DrGsqfGtcE16/S5H6g3yM7PAbV0oTIfQ//cp2lr15TzeOMO0hFQXv1oyxfOjZhHzKHRyuL
 ALn0srv3yyzf98aqOSU3bcno0YnbGrl3DyJwBea5KhkMJsVwXWe5m5j5QOxpEIECZrlCx9FeN
 ZFzNIsg9Womiv4wLhxzmZRgU7CcQDTL8a6UGJaL41zhBrco3otTVKvjjoztb3v+5uZMck65Uv
 +bxsts3eb4ZFuQUTrzp1fqWKbLVaUo3WP1GxDDW9Y8HqGEbcUHzbtonmoIE0mKOm2DkY8nzgR
 EmZwxQXNoeHmwVebGFjpL9MBPuuJ0Bjqj7ggeMlF9GU0eVulu52TLXRV5UgpEFFVtHzHMKzHS
 RJ3kQGggFWDwv8+VrHtWN8txlMKY9VQS36xyToW8ZMophnw+g1G+08qXbxcwQRqjV3fUYCu8i
 WusL3Lu2kLmhI22C0Oc3rGptV8881JBc8TcaVSsp//038bx1n487jMZN7tUuazzml1oM1qZhK
 pCyBbEVjMX+3Fy3T9EnjrCDgVCIRggNvnzbX1Ovbl6PDShdhtnGUC7c/tc7qMnTzMs36JJg6b
 7lsGnTv60/KMeMoCva2iOmQfB8cOeFUafoAJ6pi5lZAJ2MTCDSCqsu9n6FI3eyK5cie4UpW/S
 LbIENxr8Alynrw4mDQU+9QMZryONFLMNMd0mDqhA1m8eYvACio6Z4o0ki8RF7Hstu+GoVgIbr
 ycCtu5y6qDDdGE09uFJmQI2nyBlULCRRz9ZFdeObCvOdQbLgL+BgqtsSpgESthgf6rjh5P/Sd
 uDhZh3pttmZNro8ZSAnC/MBXscXzCcL81czSMHFF8jyrAmVF1Gb32VG1HULjZuGVcsI5FdO93
 6dsrxnflNbAbMLh2wDLdbJdak/rj7zITxqKy7BkuBf5cz8XDDG3ZpfArFUaT/3IKCSdzJraVs
 TNG5kYtSLF4EiQyIGw3a3FwQOo6wuCrGDL+cBZIi5WvjdjOaUJCYlbE2XTq15Mv6jmU+ceg1/
 fvS/LqfrMzY0RdWjZgMKqZQmK+lnJ9q1llCi0JPmz2A96CtVotqVePg0uFVxLkhK0bfWPjW19
 RAnSyAP+J7ov/kt06fkhi3/d5cWzWjbacunfKePMutbKA/HI5jnjlLeA7ng+NTrXLSr3fX0Y0
 EFASM4L25tkUZQOYNgLnyF1A7iaRXb4HDEdFNY3SeZKlZVmHxbTRIzmIhl+ihvr1NsL98Jnp+
 Ny8Kj410d3hZKZ9b8TIMjPYBFYAeiBb0/PWHzS/imm3tZbgdUceJRkCWi1kXV0rspk+OIAC3s
 8MEYNgUhgNqfvRL8K8ZPPWVu7KRNAuvIdpXktjavLXxeqqi2KPwphpT2wzQYaMnUtjw4D3+8i
 vOIrKmag1L3opiMvcrzVoJKeM2dkYOwo8/fHNnoXJNhmTrCvxqUo+Jf2qj+ksphcNXRAzrz2z
 ze4Dv/h8Vw/Y0VAlj2c6ywBf3RezDQQeEwNOJ4Qoa3DejyMjeQ4JImUrVGVHF0HjBIl4vAxsM
 aNg7/RckBrPJbRgXrRYaNUCuJH6Fg6HZYBUeP+8uEp+QovPsV5BDVtrklMO78wopkfAfvD7am
 IM67SZqF8fEJG02iuxZmHF8UUVstxerp6aIKAX227ZbtCtA0ZcoP4BkP1nLNQYong2NTj4oa7
 VttNOn/SDmZJ+GKA652GKUWPDTWQV7cK1JsbXL7KcdJb4rhqd6jr+7GrvUhGbvi/TjTUxkBQe
 3Zd9cZ8JDziVPZY1zp1FvFjQQ5Y8UKpV8PxKiLaTr4zhb17DFb2sDeRGQQHMMFlFPDK77FRRK
 IjEfniInfGN8O0oDdW0giY+kz/My1tAOzZKiNmJMOvyYYeoqAMOPEvR/HpHDXrQjv05EOaunr
 e5rYAjxdAaj7UswWOvOe3GgfE3LXrFNnnJcbGZLvJVPUkfmeJcd4wTC/qO4YhD0todDe7bLYA
 CbH6mPYNOBRvlVlxESIAGbkXjD+MeQFgYqne/swYLevq8oevcRS8Ramw6IFGRYOc7ZE717yEp
 vGk3TlwsUjc9OtMbajXAMsRbAsZzUPtiBkUEtQYto91cfl+fkoNDQYYhwNc6Ixy3oGPAw4E6P
 Ji/bzeWaCurBu8zOnvbU+c43UgzCpEb3vPD1ICazuuEpB9Lm/+E23l44Liml9tcJEJg0GiOll
 4ik+ZU8A6LEYLnSBf6tHHtNjNkWLbChcczHkKBfmZIggbZoLz9JwSuzQr2+sk7lxbbCkkoOGK
 2rcvxeGeUX5UpLWm72QjYfwanwBUoY3qRPt9645pQgIJuU7jAkWPy0UWS6aBaYzbjyJ0iHgdg
 qGbACqU2ZBUbi0k/UhDX/3FpTj/shSkjTMy9InrH8ki4qb+YyoiBXVXStnhsheF+lBWTBX6gc
 /wz9bMzBdIkXocHj9frKFkqe7Y1LWtivEMKfE1tXsVU0G4t5XvpETfD20qQfKysLJq2k8b6xx
 ERJkUGkL/ivVAKF9G5oIoGzGv63dXHZA2CShND6mW4W6XXd6DSsU1iao6IsfOiyBQCIscbgXG
 96R/0qOKyCnxJaUyt0v50CRpAHKYMsvv6Q6zq8JH2UMPoRyJ4heuyfFQGldeoC5Xbdh+K1++d
 O2Oa7zHUCANGAtwe6YF5s7x/uzpBY4QEdwaeSg+rGv4n6AZLLauK21wPFQk+hJf1SKnhKUtWn
 swBEv5RAw3ZLVyLpx02x7MWPJTYwQuY4QIwUz9lrAWJ0Fid64OQcM7HUn01ymZ5OnYh3mc72d
 DnW5fWSKwGGjknva6zK/0osVlOJLtvTjWea2xTTOjytgrjt8L/cSPXH5MH5JL3XZpAOacBt2q
 EXR2otLFNxAD1FvqqTKn3Y37iSh4hhgFZD1l+dO8SC/lj5sdlIftKkqWaIifQO6fIClCE3IH3
 H7UyZxe91GLHN4hqJIFy1sfF4C79ySs/WPZlRNUmGLuiNLDHBmm+D40P/jH9oJQ2WzHgQnhCu
 McDmpmCyLo95jgT/IBhuggg9ORISpyIVkHosqrA4rfwbfFN1wrvkyyb6dCGIyInym3/Sq3ga0
 4XxyflqruEGa+9V0YRx5z9H0KXAnQQ4AL1048Kc0FpypryQBqmNpiGPvY1Y8WElH7Kksn5YQv
 L+lOMIzECfHsPPCcFLQN+yxXiC8BfWSJKIMdrSSU7Q+4scTY/Ft+2EKOgMle55LyPrLvLXNF9
 oWUan9Y7GkbvVRmAUmM9oRPfcLjz836frrxwca+yDMcX2JDYkXC0yQ3Xd9U73oA8AEB2ujkU8
 YdorfOFvQ5lBfd93ojMTeoHvZVUn8N6o9G6sL+OmYN8H65d2/nvAVaUEWQ8sTx7SyDJaC7JxB
 RIwzNtQ0sF42S3rS5+2R0NYFhWhQgYe0LBSnyZ28DrBAxrpj0Lx5gU8TBSv9QM8d8t9rp8Ibw
 PoqUY4Dra/h+U0hNhFMOoTzuFIySx+yOyruGf247q3f5Rp1ol2yy3K3vpOSgJXDgh0YSjGl6A
 R979e3HBHKia5J5lc086WuGeaPHrO9obtH7i5sQ9re9zwz5349Kz85GBIGxvNFWZdL+GA1Xhy
 byJXHGvRJ5bqfe7YpFl8ZuRLmL61NQfDjWNY8dZjVZ0Eh/T0ABrV16KTbM56zielMeNzyjLqg
 V9mZaYZ2d7zZ6am5/RW23h6YjUGKPk6jbl5NMxUmt7sR+VhAz6BXFUqUn0t3m3zfS+UTs+qQ0
 NKp7Joe2i9gGFR607q/tORVtm5SEjaJ4ZKBCY+ve7zRJNVppejZ236EoZ6FWugwiRefV0z2ax
 gAnQyuIX8FKhe7ZqTwAIZc9fiJi746ekpR60H2aXN20bK9otPXQ/LRWoEWqtlxEjdmx9/8Cdh
 i0A4JSSiwQxdGe6DtnvrOLEcM06slwSKuUAfwsNBB1kriWjhJ6gtTfCNZ23fW6sjVOsGqz52c
 e5Gxy48/GDPC+OIlKN8qAFO6skKX/mLqQtBEH30VmO5nbNqPo7a3eLN4rvAolWNnvoalhnrzd
 TuKzfUJVUbVpfiFCI25BWvvqtY89Cgq/VdDLhtSoxy9iPJfX7/rJeItgjyod+rq8URRct4rXN
 c3RDQTZef7zU5UJg1qUfzTe8aXOTQZjlUCGqcUNZ8BZGsNeKbWNFDumIjCBnFm+ztT3GEozlW
 SRflrenAP9H50yWEHsKqej4bOlakM14LDAqqX4sM1HVfXhl2r0oPcgvse6RuU3PI3TGECCasy
 ikF7KiETE+v6pZmqjyqLLoPAFrjRbZLYjJykMBQdmSREXpktD3WPYn9IeCnS5+lFOhnFdY/eX
 VWHWGr9t2BJf5gLq789BmTEskGYo3RNhD7niBAXrbuUdjL1t/4zSbMlO6ZttqbzV6OqeaI329
 QVxQuOmC2scwp/XkBOfGhoK76yxqq/qDaqrW9Yl73aVRKzbBCvAr86P7foNXhUrzub6iBWZi/
 3/q+j2EiLiO62YlYh4lqtvLhGqR7YT35x6GPW6VlREk6suclpoiBE4jwfp867jfPLWg4BOSe8
 q7Zh99yBGaT5Yy3WX0vzweg06tkrflOa8RY+dauDYw8Lol5a2EEj6MxVE9AahKOD/6B4hg5g5
 YVuuKKmmjKKzBg9mrbWEuwwjyAouu6vj6zqS89WJhV8O3le+DPFbjFTxoinnNW84tX5eeC3mG
 +wEV4CXDrwyYHII3pQKjez2BUDFS9NKBw+PirsJNZZdUmqSyGtQVbQHFWaPqcXKjXzTzp7Rd0
 3QaUIRVvnFy3N/EqGtRi3ImYcAi5pMYoPUgi8mm+L/BNrNM2LQ0z0DyUyUHXmk0wmP/l1AOft
 QFWe1TieG2Ll/IPoRZFNuNc5BPDKhU2hqlmKaSpORsNF40AjqzScS2ayBMxO36Fgy4ZT/1gTW
 lI+hk8N4d3sa3s/RrXuyEj0x56NKTt9UNUA+SOd3ssCoGzJ7z5/PGnyLmTQaIYIJpn6SVCsyp
 ex1xy9DiJwUrmObw8Y/vu3HFzjSpjdL+bWBL2lC1Wn1mEBy2kJtmJJFF3yZqDf1hqPu6kwl5F
 c8QqI+aaGCvLt5O/pkUw4afSyThd3++XIyhejpytm1LJWLzoxq29xfITUKQ8kSUpNnUUsxnYO
 4JNzbrh1pwtb+4l2kMRvyOVWvIp9+zfkikyKzfyb01tifpM9XQnAef5JUgHwiZMbX73Vxh9u3
 edhSGgp+oZHkVuTkdJVgEiEZmcn891XdLJRobAVYvpqplor0GIzovl9BTjEUJNKEQAl9qC5k1
 OK7PpnrPLFpynWXjh27ZkWKmAwk0zE5e7h6PVsJVZA2SeEqcqhyGriFbF5RLVifTD7uaPwRes
 WdkNSvvSI2MBcFfjB82SgHvFcRSSTL0LfGZpAM3SYQmDWYhFUycVqOuoutf1/SaVjifKHjTyq
 4xjV0u04m37eohIpuZuy3jq9cMbisAFlvTOrgtP0F8Nz0uW9Nl9ops8+JldI952wKPzheMVHm
 Ow+6pODZ15gR6ClmSOxx45KNcbqgQr1ADM7SnuB8p2Z3QnrIOkngQnQnPHUJ2uN3Lv4mvdtw=
 =
Subject: [Buildroot] [PATCH 2/3] package/libtpms: disable building manpages
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

Libtpms builds manpages using pod2man, and fails if it is not
available. The patch adds support for --disable-docs, which Buildroot
passes by default. Found while building in a container with minimal
dependencies.

Fixes: b2eec8c6265a38cdba1afadf7f60e0fd00f3b448

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 ...ld-sys-Allow-disabling-manpage-build.patch | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 package/libtpms/0002-build-sys-Allow-disabling-manpage-build.patch

diff --git a/package/libtpms/0002-build-sys-Allow-disabling-manpage-build.patch b/package/libtpms/0002-build-sys-Allow-disabling-manpage-build.patch
new file mode 100644
index 0000000000..20849db49d
--- /dev/null
+++ b/package/libtpms/0002-build-sys-Allow-disabling-manpage-build.patch
@@ -0,0 +1,61 @@
+From 6e688d2bd1e6e1545fdb25bcfeee28f78240cbfb Mon Sep 17 00:00:00 2001
+From: Fiona Klute <fiona.klute@gmx.de>
+Date: Wed, 14 Oct 2026 17:31:09 +0200
+Subject: [PATCH] build-sys: Allow disabling manpage build
+
+In builds for embedded systems (e.g. Buildroot) manpages are not
+needed, and building them adds a dependency on pod2man. Allow passing
+"--disable-docs" to configure to disable building manpages.
+
+Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
+Upstream: https://github.com/stefanberger/libtpms/pull/641
+---
+ Makefile.am  | 5 ++++-
+ configure.ac | 6 ++++++
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 03ed7e65..9d0ea053 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -23,10 +23,13 @@
+ 
+ SUBDIRS   = \
+ 	include \
+-	man \
+ 	src \
+ 	tests
+ 
++if ENABLE_DOCS
++SUBDIRS += man
++endif # ENABLE_DOCS
++
+ ACLOCAL_AMFLAGS = -I m4
+ 
+ EXTRA_DIST = \
+diff --git a/configure.ac b/configure.ac
+index b19db106..0fc928c8 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -282,6 +282,11 @@ AC_ARG_ENABLE([test-coverage],
+   ]
+ )
+ 
++AC_ARG_ENABLE([docs],
++    [AS_HELP_STRING([--disable-docs], [Disable building documentation])],,
++    [enable_docs=yes])
++AM_CONDITIONAL(ENABLE_DOCS, [test "$enable_docs" = "yes"])
++
+ LT_INIT
+ AC_PROG_CC
+ AC_PROG_CXX
+@@ -392,5 +397,6 @@ echo "Use openssl crypto for  : $use_openssl_functions_for"
+ echo "Test coverage           : $enable_test_coverage"
+ echo "Static build            : $enable_static"
+ echo "Statically linked tests : $enable_static_tests"
++echo "Build documentation     : $enable_docs"
+ echo
+ echo
+-- 
+2.55.0
+
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
