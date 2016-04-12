From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Apr 2016 22:22:14 +0200
Subject: [Buildroot] Adding support for the Rust programming language
In-Reply-To: <20160411210358.7e7a8b4c@itchy>
References: <20160408224541.79e1ba4d@itchy> <570A77F9.50506@mind.be>
 <20160411210358.7e7a8b4c@itchy>
Message-ID: <570D58F6.3040909@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/11/16 21:03, Eric Le Bihan wrote:
> On Sun, 10 Apr 2016 17:57:45 +0200,
> Arnout Vandecappelle <arnout@mind.be> wrote :
>
>>> 1. Would it be acceptable to provide a script to generate these
>>> files from the Buildroot configuration file?
>>
>>    Obviously yes, we already do that kind of thing for some packages
>> (e.g. cmake).
>
> So, assuming the script is to be named `rust-target-gen`, it should be
> stored in support/scripts, right?

  It's only going to be used by the rust package itself, right? Not by any other 
package that happens to be written in rust? In that case, I'd put the script in 
the package/rust directory.

>
>>> 2. Would Python be a suitable language for this script? It is better
>>> suited for playing with complex structures and JSON than pure
>>> shell.
>>
>>    We try to avoid requiring python for a normal build, and use it
>> only for specific scripts at the moment (like graph-depends). So I
>> think the answer is no here. Anyway, as far as I can see from [3],
>> you don't really need a full json generator, it should be enough to
>> do some sed magic on a template file.
>
> Correct. The target specification file is not a complex JSON file.
> So I'll go for a Bash shell script (compatible with Bash 3.2, i.e. no
> use of associative arrays).
>
> Anyway, there will be a need for building host-python, in order to
> build Cargo, the official Rust package manager, as stated in [1].

  In that case, by all means use a python script that relies on host-python. 
Just make sure it runs on python3 as well.

>
>>    When you submit patches, it's probably a good idea to start with a
>> minimal patch that e.g. gives rust a hard dependency on little-endian
>> ARM v6, and add more features in subsequent patches. I expect it will
>> be something difficult to review.
>
> This looks sensible. I intend to provide the following patches:
>
> - one to add the package "host-rust" (compiler)
> - one to add the package "host-cargo" (package manager)
> - one to add "package/pkg-cargo.mk" (Rust package infrastructure)

  Don't add the package infrastructure unless you have at least one package that 
uses it, so we understand how it works.

  Also, I repeat: if supporting all possible arches/endianness/fp/... 
combinations makes it complicated, start out with a limited set of supported 
arch/... combinations and add others in later patches.

  Regards,
  Arnout

>
> Thanks for your suggestions.
>
> [1] http://www.elebihan.com/posts/using-cargo-with-buildroot-full-build.html
>
> --
> ELB
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
