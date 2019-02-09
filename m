From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 9 Feb 2019 21:16:23 +0100
Subject: [Buildroot] [PATCHv2 7/8] support/download/scp: implement
 source-check
In-Reply-To: <ed70ce0b-cce2-3267-40bd-83a25bb46b1b@mind.be>
References: <20190204180553.18394-1-patrickdepinguin@gmail.com>
 <20190204180553.18394-8-patrickdepinguin@gmail.com>
 <ed70ce0b-cce2-3267-40bd-83a25bb46b1b@mind.be>
Message-ID: <CAAXf6LXPK57YjjkW=TY=pk6TpsevC=VjaTCJfLH50UaTupqifA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El s?b., 9 feb. 2019 a las 17:48, Arnout Vandecappelle
(<arnout@mind.be>) escribi?:
>
>
>
> On 04/02/2019 19:05, Thomas De Schampheleire wrote:
> > +if [ -n "${checkonly}" ]; then
> > +    # uri now looks like:  foo.example.org:some/directory
> > +    domain="${uri%%:*}"
> > +    path="${uri#*:}/${filename}"
> > +    _ssh ${verbose} "${@}" "'${domain}'" ls "'${path}'" > /dev/null
>
>  I don't know if it happens in practice, but it is possible to have scp access
> to a machine but no 'ls' that you can run over ssh.

Yes, that is true.
If we could know that the 'ssh ls' fails because it is not supported,
we could fall back to a real scp download. But I don't think we can
differentiate that case from the case where ls works but the file is
simply not present.

So the only thing I can come up with is keep this 'ssh ls'.

One could reason that 'ssh/scp' already needs some semi-intimate
relation between the user and the server due to the trusting of the
keypair, so that it is more likely that 'ssh ls' is available, and if
it is not then user and server admin could work together to fix that.

Best regards,
Thomas
