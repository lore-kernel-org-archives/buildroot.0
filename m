From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 22 Oct 2015 21:22:55 +0200
Subject: [Buildroot] [PATCH 2/2] jq: enable host package
In-Reply-To: <20151022163902.GA3797@free.fr>
References: <1445251329-18120-1-git-send-email-patrickdepinguin@gmail.com>
 <1445251329-18120-2-git-send-email-patrickdepinguin@gmail.com>
 <20151021223958.5605a589@free-electrons.com> <20151022163902.GA3797@free.fr>
Message-ID: <CAAXf6LU_vNHQRcCQAPs-61tkPdgTA8RzuJUaJj3mNwuv7DUKfw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 22, 2015 at 6:39 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Thomas?, All,
>
> On 2015-10-21 22:39 +0200, Thomas Petazzoni spake thusly:
>> On Mon, 19 Oct 2015 12:42:09 +0200, Thomas De Schampheleire wrote:
>> > From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>> >
>> > Allow building jq as host utility for use in post-build scripts.
>> > This can be useful to created, edit, merge or even perform syntax checking
>> > on JSON files.
>> >
>> > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>>
>> Since this host package clearly doesn't fall into the "debugging tool,
>> flashing tool or image preparation tool" category, I'd like to collect
>> the opinion of a few other developers before applying.
>>
>> Peter, Arnout, Yann, what do you think?
>
> On principle, I'm OK with user-selectable host packages, as long as there
> is a real benefit to having it, like:
>   - image preparation tools (fs, flash, dtc, bootloader utils...)
>   - configuration tools (pwgen, SElinux compiler...)
>   - debug tools
>
> (Note: I'm not listing dependency of target package, since that is not
> user-selectable.)
>
> Adding any other type of package to be user-selectable will always be
> debatable. I'm not sure where we should draw the line, but we could
> provide guidelines, like:
>
>   - the package is not usually packaged in distributions (or too old);
>     libxslt for xsltproc comes to mind for example;
>
>   - the submitter comes with a very clear use-case which can not
>     otherwise be solved by other means (overlays, conditionals in
>     post-build scripts...)
>
> Now, as far as host-jq is concerned, I'm not very sure. The use-case
> Thomas DS. invoques is tweaking config files for various targets.
>
> Even though I understand that, and even though I could have thought the
> same, I'm still not quite sure. JSON is indeed a pretty much usual
> configuration format those days (whether that is sane is a question for
> another thread ;-] ). However, I would argue (weakly) that this tool
> should be provided by the host environment, not us.
>
> Except: old, enterprise-class distributions (e.g. RHEL5) may lack that
> tool, especially since it was born in 2012.

Even for RHEL6, while there possibly is an rpm package available,
tools as jq are not installed by default.
For products like those you build with buildroot, the build should be
self-contained and not depend too much on environment tools. For
things like grep, (host-)gcc, ... we can reasonably expect them to be
present. But I don't see jq in this category. At least in our case,
with all workstations involved in the organization, it is not possible
to expect all of them to contain jq.

In practice, we are using JSON files to pass some configuration to
applications. Different boards need different configuration, and jq
provides easy manipulation and reading of such files on the cmd-line
(and jansson can be used to read such files from the application).
Some of our JSON files are pre-existing in a rootfs overlay; in this
case we use host-jq to run a syntax check.
Some of them are dynamically generated and combined from the build
process using host-jq.

Hope this helps to convice you all :)

/Thomas
