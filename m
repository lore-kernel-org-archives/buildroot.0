From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 7 Nov 2020 22:32:31 +0100
Subject: [Buildroot] [PATCH 2/4] pkg-infra: add possiblity to check
 downloaded files against known hashes
In-Reply-To: <87y2jdxekx.fsf@dell.be.48ers.dk>
References: <cover.1404416102.git.yann.morin.1998@free.fr>
 <3ab303bd4f1ee78900e7fafc90947e30319635b7.1404416102.git.yann.morin.1998@free.fr>
 <retd7hxdrv.ln2@ID-313208.user.individual.net>
 <20201105211232.GO2887157@scaer> <87y2jdxekx.fsf@dell.be.48ers.dk>
Message-ID: <20201107213231.GC3971474@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-11-07 18:27 +0100, Peter Korsgaard spake thusly:
[--SNIP--]
>  > One thing we may consider adding to reinforce our robustness, is to
>  > store the file size in the hash file, in addition to the hash, e.g.:
[--SNIP--]
>  > This would protect against size-extension attacks, which afaiu are the
>  > only attacks really considered for now against sha2 [1]...
[--SNIP--]
> I wonder if the gain is worth the extra complexity for our users and in
> the implementation.

The implementation is pretty trivial. I have more changes against the
manual than I have against the code...

> Are there are any realistic size extension attacks
> against sha256?

Good question... At least, it looks like it was known from the onset,
during the standardisation process:

    https://www.cryptologie.net/article/417/how-did-length-extension-attacks-made-it-into-sha-2/
    http://www.cs.utsa.edu/~wagner/CS4363/SHS/dfips-180-2-comments1.pdf (comment #3)

And the following seems to imply it is pretty trivial (for a seasoned
cryptographer at least):

    https://www.whitehatsec.com/blog/hash-length-extension-attacks/
    https://blog.skullsecurity.org/2012/everything-you-need-to-know-about-hash-length-extension-attacks

So yes, it looks like length extension attacks (LEA) are easy...

However, now that I've read a bit more, especially that last article, I
doubt we'd be susceptible to such attacks. Indeed, LEA target MACs, that
is signatures. We're not using hashes that way; we just hash files, not
secrets.

So maybe this is not so interesting to add the size to the hash file...

Crypto is hard, damit... ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
